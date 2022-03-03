//
// Created by Ladislav Lisy on 03.03.2022.
//

import Foundation

public class PositionTerm : IPositionTerm {
    public let contract: ContractCode
    public let position: PositionCode
    public let baseTerm: IContractTerm?
    public let dateFrom: Date?
    public let dateStop: Date?
    public let termDayFrom: UInt8
    public let termDayStop: UInt8

    func isPositionActive() -> Bool {
        return (termDayFrom < TermConstants.TERM_BEG_FINISHED
                && termDayStop > TermConstants.TERM_END_FINISHED)
    }

    public func isActive() -> Bool {
        if (baseTerm != nil)
        {
            return (baseTerm!.isActive() && isPositionActive())
        }
        return isPositionActive()
    }

    init (_contract: ContractCode,
          _position: PositionCode,
          _baseTerm: IContractTerm?,
          _dateFrom: Date?,
          _dateStop: Date?,
          _termFrom: UInt8,
          _termStop: UInt8) {
        self.contract = _contract
        self.position = _position
        self.baseTerm = _baseTerm
        self.dateFrom = _dateFrom
        self.dateStop = _dateStop
        self.termDayFrom = _termFrom
        self.termDayStop = _termStop
    }

    convenience init () {
        self.init(_contract: ContractCode.new(),
                _position: PositionCode.new(),
                _baseTerm: nil,
                _dateFrom: nil,
                _dateStop: nil,
                _termFrom: TermConstants.TERM_BEG_NOTLIMIT,
                _termStop: TermConstants.TERM_END_NOTLIMIT)
    }
}
