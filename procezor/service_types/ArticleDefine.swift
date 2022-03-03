//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class ArticleDefine : IArticleDefine {
    public let code: ArticleCode
    public let seqs: ArticleSeqs
    public let role: ConceptCode

    public static func ==(lhs: ArticleDefine, rhs: ArticleDefine) -> Bool {
        lhs.code == rhs.code
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }

    init(code: ArticleCode, seqs: ArticleSeqs, role: ConceptCode) {
        self.code = code
        self.seqs = seqs
        self.role = role
    }

    convenience init() {
        self.init(code: ArticleCode.new(), seqs: ArticleSeqs.new(), role: ConceptCode.new())
    }

    convenience init(code: ArticleCode, seqs: ArticleSeqs) {
        self.init(code: code, seqs: seqs, role: ConceptCode.new())
    }

    convenience init(code: Int32, seqs: Int16, role: Int32) {
        self.init(code: ArticleCode.get(code), seqs: ArticleSeqs.get(seqs), role: ConceptCode.get(role))
    }

    convenience init(defs: ArticleDefine) {
        self.init(code: defs.code, seqs: defs.seqs, role: defs.role)
    }

    public func term() -> ArticleTerm {
        return ArticleTerm(code: code.value, seqs: seqs.value)
    }
}
