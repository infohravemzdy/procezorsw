//
// Created by Ladislav Lisy on 22.09.2021.
//

import Foundation

class ServiceExample : ServiceProcezor {
    static private let TEST_VERSION: VersionCode = VersionCode.get(100)
    static private let TEST_FINAL_ARTICLE = ExampleArticleConst.ARTICLE_INCOME_NETTO.rawValue
    static private let TEST_FINAL_CONCEPT = ExampleConceptConst.CONCEPT_INCOME_NETTO.rawValue

    static private let TEST_FINAL_DEFS: ArticleDefine = ArticleDefine(code: TEST_FINAL_ARTICLE, role: TEST_FINAL_CONCEPT)

    init () {
        super.init(_version: ServiceExample.TEST_VERSION, _finDefs: ServiceExample.TEST_FINAL_DEFS)
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
