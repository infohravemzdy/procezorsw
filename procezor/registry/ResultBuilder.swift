//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

public func isSuccess(_ result: Result<ITermResult, TermResultError>) -> Bool {
    if case .success = result { return true } else { return false }
}

public func isError(_ result: Result<ITermResult, TermResultError>) -> Bool {
    return !isSuccess(result)
}

public func successArticleValue(_ result: Result<ITermResult, TermResultError>) -> Int32 {
    switch result {
    case .success(let val): return val.article.value
    default: return 0 as Int32
    }
}

class ResultBuilder : IResultBuilder {
    var version: VersionCode

    var periodInit: IPeriod

    var articleOrder: Array<ArticleTerm>

    var articlePaths: Dictionary<ArticleTerm, Array<ArticleDefine>>

    var articleModel: Array<ArticleSpec> = [ArticleSpec]()
    var conceptModel: Array<ConceptSpec> = [ConceptSpec]()

    init () {
        self.version = VersionCode.new()
        self.periodInit = Period.new()
        self.articleOrder = [ArticleTerm]()
        self.articlePaths = [ArticleTerm:Array<ArticleDefine>]()
    }

    func initWithPeriod(version: VersionCode,
                        period: IPeriod,
                        articleFactory: ArticleSpecFactory,
                        conceptFactory: ConceptSpecFactory) -> Bool {
        self.version = version
        self.periodInit = period

        articleModel = articleFactory.getSpecList(period: period, version: version)

        conceptModel = conceptFactory.getSpecList(period: period, version: version)

        let dependencyGraph = DependencyGraph()

        (articleOrder, articlePaths) = dependencyGraph.initGraphModel(articlesModel: articleModel, conceptsModel: conceptModel)

        return true
    }

    func getResults(ruleset: IBundleProps,
                    contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
                    targets: ITermTargetList, calcArticles: Array<ArticleCode>) -> BuilderResultList {
        let calculTargets = buildCalculsList(period: periodInit, ruleset: ruleset,
                contractTerms: contractTerms, positionTerms: positionTerms,
                targets: targets, calcArticles: calcArticles)

        let calculResults = buildResultsList(period: periodInit, ruleset: ruleset, calculs: calculTargets)

        return calculResults
    }
    private func buildCalculsList(
        period: IPeriod, ruleset: IBundleProps,
        contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
        targets: ITermTargetList,
        calcArticles: Array<ArticleCode>) -> Array<ITermCalcul> {
        let specDefines: Array<ArticleSpec?> = calcArticles.map { a in articleModel.first { m in m.code == a } ?? nil }

        let calcDefines = specDefines.filter { s in (s != nil) }.map { t in t! }
                .map { x in ArticleDefine(code: x.code.value, seqs: x.seqs.value, role: x.role.value) }

        let targetsSpec: ITermTargetList = addFinDefToTargets(period: period, ruleset: ruleset,
                contractTerms: contractTerms, positionTerms: positionTerms,
                targets: targets.map { $0 }, calcDefines: calcDefines)

        let targetsStep: ITermTargetList = addExternToTargets(period: period, ruleset: ruleset,
                contractTerms: contractTerms, positionTerms: positionTerms,
                targets: targetsSpec)

        let calculsList: Array<ITermCalcul> = addTargetToCalculs(targets: targetsStep)

        return calculsList
    }
    private func buildResultsList(period: IPeriod, ruleset: IBundleProps, calculs: Array<ITermCalcul>) -> BuilderResultList {
        let resultsInit: BuilderResultList = [BuilderResult]()

        return calculs.reduce(resultsInit) { (agr, x : ITermCalcul) in return
            mergeResults(results: agr, resultValues: x.getResults(period: period, ruleset: ruleset, results: agr))
        }
    }
    private func mergeResults(results: BuilderResultList, resultValues: BuilderResultList) -> BuilderResultList {
        return results + resultValues
    }
    private func mergeResults(results: BuilderResultList, resultValues: BuilderResult...) -> BuilderResultList {
        return mergeResults(results: results, resultValues: resultValues)
    }
    private func addFinDefToTargets(period: IPeriod, ruleset: IBundleProps,
                                    contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
                                    targets: ITermTargetList, calcDefines: Array<ArticleDefine>) -> Array<ITermTarget> {
        return mergeListPendings(period: period, ruleset: ruleset,
                contractTerms: contractTerms, positionTerms: positionTerms,
                initRes: targets, calcDefines: calcDefines)
    }
    private func addExternToTargets(period: IPeriod, ruleset: IBundleProps,
                                    contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
                                    targets: ITermTargetList) -> Array<ITermTarget> {
        let targetsInit: ITermTargetList = targets.map { $0 }

        let targetList = targets.reduce(targetsInit) {agr, item in
            return  mergePendings(period: period, ruleset: ruleset,
                    contractTerms: contractTerms, positionTerms: positionTerms,
                    initRes: agr, target: item)}.map { $0 }

        let targetSort = targetList.sorted (by: compareTargets(topoOrders: articleOrder))

        return targetSort
    }
    private func addDefinesToTargets(period: IPeriod, ruleset: IBundleProps,
                                     contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
                                     targets: ITermTargetList, defines: Array<ArticleDefine>) -> Array<ITermTarget>
    {
        return defines.flatMap { x in
            getTargetList(period: period, ruleset: ruleset, conceptsModel: conceptModel,
                    contractTerms: contractTerms, positionTerms: positionTerms,
                    targets: targets.filter {t in t.article == x.code}, article: x.code, concept: x.role).map { $0 }
        }
    }
    private func addTargetToCalculs(targets: ITermTargetList) -> Array<ITermCalcul> {
        let targetsRets = targets.map { it -> ITermCalcul in
            let articleSpec = articleModel.first {a in (a.code == it.article)}
            return TermCalcul(target: it, spec: articleSpec, resultDelegate: getCalculFunc(conceptsModel: conceptModel, concept: it.concept)) }
        return targetsRets.map { $0 }
    }
    private func mergePendings(period: IPeriod, ruleset: IBundleProps,
                               contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
                               initRes: ITermTargetList, target: ITermTarget) -> Array<ITermTarget> {
        var resultList: ITermTargetList = initRes.map { $0 }

        let pendingsSpec = articlePaths.first { k, v in return k.code == target.article }
        let pendingsPath = pendingsSpec?.value ?? nil

        if (pendingsPath != nil) {
            resultList = pendingsPath!.reduce(resultList) { agr, def in
                return mergeItemPendings(period: period, ruleset: ruleset,
                        contractTerms: contractTerms, positionTerms: positionTerms,
                        initRes: agr, articleDefs: def).map { $0 }}
        }
        return resultList
    }
    private func mergeItemPendings(period: IPeriod, ruleset: IBundleProps,
                                   contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
                                   initRes: ITermTargetList, articleDefs: ArticleDefine) -> Array<ITermTarget> {
        var resultList: ITermTargetList = initRes.map { $0 }

        let initTargets = initRes.filter { x in return x.article == articleDefs.code }

        let targetList = getTargetList(period: period, ruleset: ruleset, conceptsModel: conceptModel,
                contractTerms: contractTerms, positionTerms: positionTerms,
                targets: initTargets, article: articleDefs.code, concept: articleDefs.role)

        resultList = (resultList + targetList)

        return resultList
    }
    private func mergeListPendings(period: IPeriod, ruleset: IBundleProps,
                                   contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
                                   initRes: ITermTargetList, calcDefines: Array<ArticleDefine>) -> Array<ITermTarget> {
        var resultList: ITermTargetList = initRes.map { $0 }

        let defineList = calcDefines.filter {x in initRes.first {t in t.article == x.code}==nil}

        let targetList = addDefinesToTargets(period: period, ruleset: ruleset,
                contractTerms: contractTerms, positionTerms: positionTerms,
                targets: initRes, defines: defineList)

        resultList = (resultList + targetList)

        return resultList
    }
    private func getCalculFunc(conceptsModel: Array<ConceptSpec>, concept: ConceptCode) -> ResultFunc? {
        let conceptSpec = conceptsModel.first { a in return (a.code == concept) }

        return conceptSpec?.resultDelegate ?? notFoundCalculFunc
    }
    private func getTargetList(period: IPeriod, ruleset: IBundleProps, conceptsModel: Array<ConceptSpec>,
                               contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
                               targets: ITermTargetList, article: ArticleCode, concept:ConceptCode) -> Array<ITermTarget> {
        let monthCode = MonthCode.get(period.code)
        let variant = VariantCode.get(1)

        let conceptSpec = conceptsModel.first {a in a.code.value == concept.value }
        if (conceptSpec == nil) {
            let contract = ContractCode.new()
            let position = PositionCode.new()
            return [TermTarget(_month: monthCode, _contract: contract, _position: position, _variant: variant, _article: article, _concept: concept)]
        }
        return conceptSpec!.defaultTargetList(article: article, period: period, ruleset: ruleset, month: monthCode,
                contractTerms: contractTerms, positionTerms: positionTerms,
                targets: targets, vars: variant)
    }

    private func notFoundCalculFunc(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultError = TermResultError.CreateNoResultFuncError(period: period, target: target)
        return [.failure(resultError)]
    }
    private func compareTargets(topoOrders: Array<ArticleTerm>) -> (ITermTarget, ITermTarget) -> Bool {
        let codeOrders: Array<ArticleCode> = topoOrders.map { $0.code }
        let lessThan: (ITermTarget, ITermTarget) -> Bool = { (x, y) in
            let xIndex = codeOrders.firstIndex(of: x.article)

            let yIndex = codeOrders.firstIndex(of: y.article)

            var compareIndex = 0

            if (xIndex == nil && yIndex == nil)
            {
                compareIndex = 0
            }
            else if (xIndex == nil && yIndex != nil)
            {
                compareIndex = -1
            }
            else if (xIndex != nil && yIndex == nil)
            {
                compareIndex = 1
            }
            else
            {
                let xIndexValue = xIndex!
                let yIndexValue = yIndex!
                if (xIndexValue > yIndexValue)
                {
                    compareIndex = 1
                }
                else if (xIndexValue < yIndexValue)
                {
                    compareIndex = -1
                }
                else
                {
                    compareIndex = 0
                }
            }
            return compareIndex < 0
        }
        return lessThan
    }
}
