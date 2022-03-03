//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

protocol IArticleSpecProvider : ISpecProvider where S == ArticleSpec, C == ArticleCode {
}

class ArticleSpecProvider : IArticleSpecProvider {
    let code: ArticleCode

    init (article: ArticleCode) {
        self.code = article
    }

    convenience init (codeInt: Int32) {
        self.init(article: ArticleCode.get(codeInt))
    }

    func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        fatalError("getSpec(period:version:) has not been implemented")
    }
}
