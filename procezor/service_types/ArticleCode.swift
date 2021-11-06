//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class ArticleCode : Comparable, Hashable, ISpecCode {
    public let value: Int32

    public static func ==(lhs: ArticleCode, rhs: ArticleCode) -> Bool {
        if lhs == nil && rhs == nil {
            return true
        }
        if lhs != nil && rhs != nil {
            return lhs.value == rhs.value
        }
        return false
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

    static func new() -> ArticleCode {
        return ArticleCode(0)
    }

    static func get(_ value: Int32) -> ArticleCode {
        return ArticleCode(value)
    }

    public var hashValue: Int {
        return value.hashValue
    }
}
