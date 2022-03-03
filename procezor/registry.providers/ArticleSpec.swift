//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class ArticleSpec : IArticleSpec, Comparable {
    public static func ==(lhs: ArticleSpec, rhs: ArticleSpec) -> Bool {
        lhs.code == rhs.code
    }

    public static func <(lhs: ArticleSpec, rhs: ArticleSpec) -> Bool {
        lhs.code < rhs.code
    }
    public let code: ArticleCode

    public let role: ConceptCode

    public let sums: Array<ArticleCode>

    public func defs() -> ArticleDefine {
        return ArticleDefine(code: code.value, role: role.value)
    }

    init (article: ArticleCode, concept: ConceptCode, sums: Array<ArticleCode>) {
        self.code = article
        self.role = concept
        self.sums = sums.map { $0 }
    }

    init (code: Int32, role: Int32,  sums: Array<Int32>) {
        self.code = ArticleCode.get(code)
        self.role = ConceptCode.get(role)
        self.sums = ArticleSpec.constToSumsArray(sums)
    }

    public static func constToSumsArray(_ sums: Array<Int32>) -> Array<ArticleCode> {
        return sums.map { ArticleCode.get($0) }
    }

    public static func specsToSumsArray(_ sums: Array<T>) -> Array<ArticleCode> {
        return sums.map { ArticleCode.get($0.value) }
    }
}
