//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class ConceptCode : Comparable, ISpecCode {
    public let value: Int32

    public static func ==(lhs: ConceptCode, rhs: ConceptCode) -> Bool {
        if lhs == nil && rhs == nil {
            return true
        }
        if lhs != nil && rhs != nil {
            return lhs.value == rhs.value
        }
        return false
    }

    public static func <(lhs: ConceptCode, rhs: ConceptCode) -> Bool {
        lhs.value < rhs.value
    }

    init () {
        self.value = 0
    }

    init (_ value: Int32) {
        self.value = value
    }

    static func new() -> ConceptCode {
        return ConceptCode(0)
    }

    static func get(_ value: Int32) -> ConceptCode {
        return ConceptCode(value)
    }

}
