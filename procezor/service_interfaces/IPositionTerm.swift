//
// Created by Ladislav Lisy on 03.03.2022.
//

import Foundation

public protocol IPositionTerm {
    var contract: ContractCode { get }
    var position: PositionCode { get }
    var dateFrom: Date? { get }
    var dateStop: Date?  { get }
    var termDayFrom: UInt8 { get }
    var termDayStop: UInt8 { get }
    func isActive() -> Bool
}
