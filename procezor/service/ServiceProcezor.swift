//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

class ServiceProcezor : IServiceProcezor {
    public let version: VersionCode

    public let finDefs: ArticleDefine

    let builder = ResultBuilder()
    var articleFactory: ArticleSpecFactory? = nil
    var conceptFactory: ConceptSpecFactory? = nil

    init (_version: VersionCode, _finDefs: ArticleDefine) {
        self.version = _version
        self.finDefs = _finDefs
        let buildSuccess = self.buildFactories()
        if buildSuccess == false {
            // log error
        }
    }
    func getResults(period: IPeriod, ruleset: IBundleProps, targets: ITermTargetList) -> BuilderResultList {
        var results: BuilderResultList = [BuilderResult]()

        let success: Bool = initWithPeriod(period: period)

        if (!success) {
            return results
        }
        results = builder.getResults(ruleset: ruleset, targets: targets, finDefs: finDefs)
        return results
    }

    func initWithPeriod(period: IPeriod) -> Bool {
        var initResult: Bool = true

        let initBuilder: Bool = !builder.periodInit.equals(other: period)

        if (initBuilder && articleFactory != nil && conceptFactory != nil) {
            initResult = builder.initWithPeriod(version: version, period: period,
                    articleFactory: articleFactory!, conceptFactory: conceptFactory!)
        }
        return initResult
    }

    func buildFactories() -> Bool {
        let articleFactorySuccess: Bool = buildArticleFactory()

        let conceptFactorySuccess: Bool = buildConceptFactory()

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
