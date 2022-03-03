//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class PositionCode : Comparable, ICodeValue {
    public let value: Int16

    public static func ==(lhs: PositionCode, rhs: PositionCode) -> Bool {
        lhs.value == rhs.value
    }

    public static func <(lhs: PositionCode, rhs: PositionCode) -> Bool {
        lhs.value < rhs.value
    }

    init (_ value: Int16) {
        self.value = value
    }

    static func zero() -> PositionCode {
        return new()
    }
    static func new() -> PositionCode {
        return PositionCode(0)
    }

    static func get(_ value: Int16) -> PositionCode {
        return PositionCode(value)
    }
}
