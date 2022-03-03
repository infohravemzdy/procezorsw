//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class VariantCode : Comparable, ICodeValue {
    public let value: Int16

    public static func ==(lhs: VariantCode, rhs: VariantCode) -> Bool {
        lhs.value == rhs.value
    }

    public static func <(lhs: VariantCode, rhs: VariantCode) -> Bool {
        lhs.value < rhs.value
    }

    init (_ value: Int16) {
        self.value = value
    }

    static func zero() -> VariantCode {
        return new()
    }
    static func new() -> VariantCode {
        return VariantCode(0)
    }

    static func get(_ value: Int16) -> VariantCode {
        return VariantCode(value)
    }
}
