//
// Created by Ladislav Lisy on 04.03.2022.
//

import Foundation
import legalios

class ServiceProcezor : IServiceProcezor {
    public let version: VersionCode

    public let calcArticles: Array<ArticleCode>

    let builder = ResultBuilder()
    var articleFactory: ArticleSpecFactory? = nil
    var conceptFactory: ConceptSpecFactory? = nil

    init (_version: VersionCode, _calcArticles: Array<ArticleCode>) {
        self.version = _version
        self.calcArticles = _calcArticles
    }

    func builderOrder() -> Array<ArticleTerm> {
        return builder.articleOrder
    }
    func builderPaths() -> Dictionary<ArticleTerm, Array<ArticleDefine>> {
        return builder.articlePaths
    }

    func getContractTerms(period: IPeriod, targets: ITermTargetList) -> Array<ContractTerm> {
        return []
    }

    func getPositionTerms(period: IPeriod, contracts: Array<ContractTerm>, targets: ITermTargetList) -> Array<PositionTerm> {
        return []
    }

    func getResults(period: IPeriod, ruleset: IBundleProps, targets: ITermTargetList) -> BuilderResultList {
        var results: BuilderResultList = [BuilderResult]()

        let success: Bool = initWithPeriod(period: period)

        if (!success) {
            return results
        }
        let contractTerms = getContractTerms(period: period, targets: targets)
        let positionTerms = getPositionTerms(period: period, contracts: contractTerms, targets: targets)

        results = builder.getResults(ruleset: ruleset,
                contractTerms: contractTerms, positionTerms: positionTerms,
                targets: targets, calcArticles: calcArticles)
        return results
    }

    func initWithPeriod(period: IPeriod) -> Bool {
        var initResult: Bool = true

        let initBuilder: Bool = !builder.periodInit.equals(other: period)

        if (initBuilder && articleFactory != nil && conceptFactory != nil) {
            initResult = builder.initWithPeriod(version: version, period: period,
                    articleFactory: articleFactory!, conceptFactory: conceptFactory!)
        }
        if initResult == false {
            print("Period: \(period.code), init with period failed".utf8)
        }
        return initResult
    }

    func buildFactories() -> Bool {
        let articleFactorySuccess: Bool = buildArticleFactory()

        let conceptFactorySuccess: Bool = buildConceptFactory()

        if !(articleFactorySuccess && conceptFactorySuccess) {
            print("ServiceProcezor::BuildFactories(): Version: \(self.version), build factories failed".utf8)
        }
        return articleFactorySuccess && conceptFactorySuccess
    }

    func getArticleSpec(code: ArticleCode, period: IPeriod, version: VersionCode) -> ArticleSpec? {
        if  (articleFactory == nil) {
            return nil
        }
        return articleFactory?.getSpec(code: code, period: period, version: version)
    }

    func getConceptSpec(code: ConceptCode, period: IPeriod, version: VersionCode) -> ConceptSpec? {
        if  (conceptFactory == nil) {
            return nil
        }
        return conceptFactory?.getSpec(code: code, period: period, version: version)
    }
    func buildArticleFactory() -> Bool {
        return false
    }
    func buildConceptFactory() -> Bool {
        return false
    }
}
