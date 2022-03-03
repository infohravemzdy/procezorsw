//
// Created by Ladislav Lisy on 03.03.2022.
//

import Foundation

public class ArticleSeqs: Comparable, Hashable, ISpecSeqs {
    public let value: Int16

    public static func ==(lhs: ArticleSeqs, rhs: ArticleSeqs) -> Bool {
        lhs.value == rhs.value
    }

    public static func <(lhs: ArticleSeqs, rhs: ArticleSeqs) -> Bool {
        lhs.value < rhs.value
    }

    init() {
        self.value = 0
    }

    init(_ value: Int16) {
        self.value = value
    }

    static func zero() -> ArticleSeqs {
        return new()
    }

    static func new() -> ArticleSeqs {
        return ArticleSeqs(0)
    }

    static func get(_ value: Int16) -> ArticleSeqs {
        return ArticleSeqs(value)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

