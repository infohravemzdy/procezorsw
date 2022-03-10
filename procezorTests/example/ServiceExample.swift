//
// Created by Ladislav Lisy on 04.03.2022.
//

import Foundation
@testable import procezor

class ServiceExample : ServiceProcezor {
    static private let TEST_VERSION: VersionCode = VersionCode.get(100)
    static private let TEST_FINAL_ARTICLE = ExampleArticleConst.ARTICLE_INCOME_NETTO.rawValue

    static private let TEST_CALCS_ARTICLE: Array<ArticleCode> = [ArticleCode.get(TEST_FINAL_ARTICLE)]

    init() {
        super.init(_version: ServiceExample.TEST_VERSION, _calcArticles: ServiceExample.TEST_CALCS_ARTICLE)
        let buildSuccess = buildFactories()
        if buildSuccess == false {
            print("Version: \(self.version), build factories failed".utf8)
        }
    }

    override func buildArticleFactory() -> Bool {
        articleFactory = ExampleArticleFactory()

        return true
    }

    override func buildConceptFactory() -> Bool {
        conceptFactory = ExampleConceptFactory()

        return true
    }
}
