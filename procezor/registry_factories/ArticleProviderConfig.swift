//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

class ArticleProviderConfig: ArticleSpecProvider {
    let articleSpec: ArticleSpecConfig

    init (code: Int32, seqs: Int16, role: Int32,  sums: Array<Int32>) {
        self.articleSpec = ArticleSpecConfig(code: code, seqs: seqs, role: role, sums: sums)
        super.init(article: ArticleCode.get(code))
    }
    init (article: ArticleCode, sequens: ArticleSeqs, concept: ConceptCode, sums: Array<ArticleCode>) {
        self.articleSpec = ArticleSpecConfig(code: article.value, seqs: sequens.value, role: concept.value, sums: sums.map { $0.value })
        super.init(article: article)
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return articleSpec
    }
}

class ArticleSpecConfig : ArticleSpec {
    override init (code: Int32, seqs: Int16, role: Int32,  sums: Array<Int32>) {
        super.init(code: code, seqs: seqs, role: role, sums: sums)
    }
}
