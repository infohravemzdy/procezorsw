//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class ContractCode : Comparable, ICodeValue {
    public let value: Int16

    public static func ==(lhs: ContractCode, rhs: ContractCode) -> Bool {
        if lhs == nil && rhs == nil {
            return true
        }
        if lhs != nil && rhs != nil {
            return lhs.value == rhs.value
        }
        return false
    }

    public static func <(lhs: ContractCode, rhs: ContractCode) -> Bool {
        lhs.value < rhs.value
    }

    init (_ value: Int16) {
        self.value = value
    }

    static func new() -> ContractCode {
        return ContractCode(0)
    }

    static func get(_ value: Int16) -> ContractCode {
        return ContractCode(value)
    }
}
