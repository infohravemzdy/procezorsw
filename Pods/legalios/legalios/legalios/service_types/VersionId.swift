//
// Created by Ladislav Lisy on 13.06.2021.
//

import Foundation

struct VersionId : Comparable, IVersionId {
    static let VERSION_ZERO: Int16 = 0

    static func <(lhs: VersionId, rhs: VersionId) -> Bool {
        lhs.value < rhs.value
    }

    typealias T = Int16

    init () {
        self.value = VersionId.VERSION_ZERO
    }

    init (_ value: Int16) {
        self.value = value
    }

    static func new() -> VersionId {
        return VersionId(VersionId.VERSION_ZERO)
    }

    static func get(value: Int16) -> VersionId {
        return VersionId(value)
    }

    let value: T
}
