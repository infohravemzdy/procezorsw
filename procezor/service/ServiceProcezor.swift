//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

class ServiceProcezor : IServiceProcezor {
    public let version: VersionCode

    public let finDefs: ArticleDefine

    let builder = ResultBuilder()
    var articleFactory: ArticleSpecFactory? = nil
    var conceptFactory: ConceptSpecFactory? = nil

    init (_version: VersionCode, _finDefs: ArticleDefine) {
        self.version = _version
        self.finDefs = _finDefs
        self.buildFactories()
    }
    func getResults(period: IPeriod, targets: ITermTargetList) -> BuilderResultList {
        var results: BuilderResultList = [BuilderResult]()

        let success: Bool = initWithPeriod(period: period)

        if (!success) {
            return results
        }
        if (builder != nil) {
            results = builder.getResults(targets: targets, finDefs: finDefs)
        }
        return results
    }

    func initWithPeriod(period: IPeriod) -> Bool {
        var initResult: Bool = false

        if (builder != nil) {
            initResult = true
        }

        var initBuilder: Bool = false

        if (builder != nil) {
            initBuilder = !builder.periodInit.equals(other: period)
        }

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
