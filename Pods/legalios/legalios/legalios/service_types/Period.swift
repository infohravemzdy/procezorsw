//
// Created by Ladislav Lisy on 13.06.2021.
//

import Foundation

class Period : NSObject, NSCopying, IPeriod {
    static let ZeroCode: Int32 = 0

    init (code: Int32) {
        self.code = code
    }

    init (year: Int16, month: Int16) {
        self.code = Int32(year)*100 + Int32(month)
    }

    let code: Int32
    var year: Int16 { get { return (Int16)(code / 100) } }
    var month: Int16 { get { return (Int16)(code % 100) } }

    func equals(other: IPeriod) -> Bool {
        return self.code == other.code
    }

    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Period(code: code)
        return copy
    }

    static func zero() -> IPeriod {
        return Period(code: ZeroCode)
    }
    static func new() -> IPeriod {
        return Period(code: ZeroCode)
    }
    static func get(_ code: Int32) -> IPeriod {
        return Period(code: code)
    }
    static func getWithYearMonth(year:Int16, month:Int16) -> IPeriod {
        return Period(year: year, month: month)
    }
}
