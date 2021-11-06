//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class MonthCode : Comparable, ICodeValue {
    public let value: Int32

    public static func ==(lhs: MonthCode, rhs: MonthCode) -> Bool {
        if lhs == nil && rhs == nil {
            return true
        }
        if lhs != nil && rhs != nil {
            return lhs.value == rhs.value
        }
        return false
    }

    public static func <(lhs: MonthCode, rhs: MonthCode) -> Bool {
        lhs.value < rhs.value
    }

    init (_ value: Int32) {
        self.value = value
    }

    static func new() -> MonthCode {
        return MonthCode(0)
    }

    static func get(_ value: Int32) -> MonthCode {
        return MonthCode(value)
    }
}
