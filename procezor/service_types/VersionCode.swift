//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class VersionCode : Comparable, ICodeValue {
    public let value: Int16

    public static func ==(lhs: VersionCode, rhs: VersionCode) -> Bool {
        lhs.value == rhs.value
    }

    public static func <(lhs: VersionCode, rhs: VersionCode) -> Bool {
        lhs.value < rhs.value
    }

    init () {
        self.value = 0
    }

    init (_ value: Int16) {
        self.value = value
    }

    static func zero() -> VersionCode {
        return new()
    }
    static func new() -> VersionCode {
        return VersionCode(0)
    }

    static func get(_ value: Int16) -> VersionCode {
        return VersionCode(value)
    }
}
