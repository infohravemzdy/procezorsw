//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

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

    var articleOrder: Array<ArticleCode>

    var articlePaths: Dictionary<ArticleCode, Array<ArticleDefine>>

    var articleModel: Array<ArticleSpec> = [ArticleSpec]()
    var conceptModel: Array<ConceptSpec> = [ConceptSpec]()

    init () {
        self.version = VersionCode.new()
        self.periodInit = Period.new()
        self.articleOrder = [ArticleCode]()
        self.articlePaths = [ArticleCode:Array<ArticleDefine>]()
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

    func getResults(targets: Array<ITermTarget>, finDefs: ArticleDefine) -> BuilderResultList {
        let calculTargets = buildCalculsList(period: periodInit, targets: targets, finDefs: finDefs)

        let calculResults = buildResultsList(period: periodInit, calculs: calculTargets)

        return calculResults
    }
    private func buildCalculsList(
        period: IPeriod,
        targets: Array<ITermTarget>,
        finDefs: ArticleDefine) -> Array<ITermCalcul> {
        let finDefine: ArticleDefine = ArticleDefine(defs: finDefs)

        let targetsSpec: Array<ITermTarget> = addFinDefToTargets(period: period, targets: targets.map { $0 }, finDefs: finDefine)

        let targetsStep: Array<ITermTarget> = addExternToTargets(period: period, targets: targetsSpec)

        let calculsList: Array<ITermCalcul> = addTargetToCalculs(targets: targetsStep)

        return calculsList
    }
    private func buildResultsList(period: IPeriod, calculs: Array<ITermCalcul>) -> BuilderResultList {
        var resultsInit: BuilderResultList = [BuilderResult]()

        return calculs.reduce(resultsInit) { (agr, x : ITermCalcul) in return
            mergeResults(results: agr, resultValues: x.getResults(period: period, results: agr))
        }
    }
    private func mergeResults(results: BuilderResultList, resultValues: BuilderResultList) -> BuilderResultList {
        return results + resultValues
    }
    private func mergeResults(results: BuilderResultList, resultValues: BuilderResult...) -> BuilderResultList {
        return mergeResults(results: results, resultValues: resultValues)
    }
    private func addFinDefToTargets(period: IPeriod, targets: Array<ITermTarget>, finDefs: ArticleDefine) -> Array<ITermTarget> {
        return mergeItemPendings(period: period, initRes: targets, articleDefs: finDefs)
    }
    private func compareTargets(topoOrders: Array<ArticleCode>) -> (ITermTarget, ITermTarget) -> Bool {
        let lessThan: (ITermTarget, ITermTarget) -> Bool = { (x, y) in
            let xIndex = topoOrders.firstIndex(of: x.article)

            let yIndex = topoOrders.firstIndex(of: y.article)

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
    private func addExternToTargets(period: IPeriod, targets: Array<ITermTarget>) -> Array<ITermTarget> {
        var targetsInit: Array<ITermTarget> = targets.map { $0 }

        var targetList = targets.reduce(targetsInit) {agr, item in
            return  mergePendings(period: period, initRes: agr, target: item)}.map { $0 }

        var targetSort = targetList.sorted (by: compareTargets(topoOrders: articleOrder))

        return targetSort
    }
    private func addTargetToCalculs(targets: Array<ITermTarget>) -> Array<ITermCalcul> {
        let targetsRets = targets.map { it in
            return TermCalcul(target: it, resultDelegate: getCalculFunc(conceptsModel: conceptModel, concept: it.concept)) }
        return targetsRets.map { $0 }
    }
    private func mergePendings(period: IPeriod, initRes: Array<ITermTarget>, target: ITermTarget) -> Array<ITermTarget> {
        var resultList: Array<ITermTarget> = initRes.map { $0 }

        let pendingsSpec = articlePaths.first { k, v in return k == target.article }
        let pendingsPath = pendingsSpec?.value ?? nil

        if (pendingsPath != nil) {
            resultList = pendingsPath!.reduce(resultList) { agr, def in
                return mergeItemPendings(period: period, initRes: agr, articleDefs: def).map { $0 }}
        }
        return resultList
    }
    private func mergeItemPendings(period: IPeriod, initRes: Array<ITermTarget>, articleDefs: ArticleDefine) -> Array<ITermTarget> {
        let monthCode = MonthCode.get(period.code)

        let contract = ContractCode.new()
        let position = PositionCode.new()

        var resultList: Array<ITermTarget> = initRes.map { $0 }

        let initTarget = initRes.first { x in return x.article == articleDefs.code }

        if (initTarget == nil) {
            let variant = VariantCode.get(1)

            let resultItem = TermTarget(_month: monthCode, _contract: contract, _position: position,
                    _variant: variant, _article: articleDefs.code, _concept: articleDefs.role)

            resultList = (resultList + [resultItem])
        }

        return resultList
    }
    private func getCalculFunc(conceptsModel: Array<ConceptSpec>, concept: ConceptCode) -> ResultFunc? {
        let conceptSpec = conceptsModel.first { a in return (a.code == concept) }

        return conceptSpec?.resultDelegate ?? notFoundCalculFunc
    }
    private func notFoundCalculFunc(target: ITermTarget, period: IPeriod, results: BuilderResultList) -> BuilderResultList
    {
        let resultError = TermResultError.CreateNoResultFuncError(period: period, target: target)
        return [.failure(resultError)]
    }
}
