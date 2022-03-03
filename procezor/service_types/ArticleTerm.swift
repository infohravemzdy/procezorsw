//
// Created by Ladislav Lisy on 03.03.2022.
//

import Foundation

public class ArticleTerm : Comparable, Hashable {
    public let code: ArticleCode
    public let seqs: ArticleSeqs

    public static func ==(lhs: ArticleTerm, rhs: ArticleTerm) -> Bool {
        lhs.code == rhs.code && lhs.seqs == rhs.seqs
    }

    public static func <(lhs: ArticleTerm, rhs: ArticleTerm) -> Bool {
        if lhs.seqs == rhs.seqs {
            return lhs.code < rhs.code
        }
        return lhs.seqs < rhs.seqs
    }

    init() {
        self.code = ArticleCode.new()
        self.seqs = ArticleSeqs.new()
    }

    init(code: Int32, seqs: Int16) {
        self.code = ArticleCode.get(code)
        self.seqs = ArticleSeqs.get(seqs)
    }

    static func zero() -> ArticleTerm {
        return new()
    }
    static func new() -> ArticleTerm {
        return ArticleTerm(code: 0, seqs: 0)
    }

    static func get(code: Int32, seqs: Int16) -> ArticleTerm {
        return ArticleTerm(code: code, seqs: seqs)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(seqs.value)
        hasher.combine(code.value)
    }
}

