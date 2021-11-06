//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

protocol IArticleSpecFactory : ISpecFactory where SP : IArticleSpecProvider, SS : IArticleSpec, SC : ArticleCode {
}

struct ProviderRecord {
    let article: Int32
    let concept: Int32
    let sums: Array<Int32>

    init (article: Int32, concept: Int32, sums: Array<Int32>) {
        self.article = article
        self.concept = concept
        self.sums = sums.map { $0 }
    }
}

class NotFoundArticleSpec : ArticleSpec {
    init (article: ArticleCode) {
        super.init(article: article, concept:
        ConceptCode.get(ArticleConst.ARTICLE_NOTFOUND.rawValue), sums:[ArticleCode]())
    }

    convenience init () {
        self.init(article: ArticleCode.get(ArticleConst.ARTICLE_NOTFOUND.rawValue))
    }
}

class NotFoundArticleProvider : ArticleSpecProvider {
    init () {
        super.init(article: ArticleCode.get(ArticleConst.ARTICLE_NOTFOUND.rawValue))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return NotFoundArticleSpec(article: code) as! ArticleSpec
    }
}

class ArticleSpecFactory : SpecFactory<ArticleSpecProvider, ArticleSpec, ArticleCode> {
    init (provList: Array<ArticleSpecProvider>) {
        super.init(provList: provList, defProv: NotFoundArticleProvider(), defSpec: NotFoundArticleSpec())
    }

    static func BuildProvidersFromRecords(records: Array<ProviderRecord>) -> Array<ArticleSpecProvider> {
        var providers: Array<ArticleSpecProvider> = records.map { x in
            return ArticleProviderConfig(code: x.article, role: x.concept, sums: x.sums)
        }
        return providers
    }
}
