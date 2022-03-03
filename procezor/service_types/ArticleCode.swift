//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class ArticleCode : Comparable, Hashable, ISpecCode {
    public let value: Int32

    public static func ==(lhs: ArticleCode, rhs: ArticleCode) -> Bool {
        lhs.value == rhs.value
    }

    public static func <(lhs: ArticleCode, rhs: ArticleCode) -> Bool {
        lhs.value < rhs.value
    }

    init() {
        self.value = 0
    }

    init(_ value: Int32) {
        self.value = value
    }

    static func zero() -> ArticleCode {
        return new()
    }
    static func new() -> ArticleCode {
        return ArticleCode(0)
    }

    static func get(_ value: Int32) -> ArticleCode {
        return ArticleCode(value)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}
