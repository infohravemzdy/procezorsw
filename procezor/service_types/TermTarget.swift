//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class TermTarget : TermSymbol, ITermTarget {
    public let concept: ConceptCode

    init (_month: MonthCode,
          _contract: ContractCode,
          _position: PositionCode,
          _variant: VariantCode,
          _article: ArticleCode,
          _concept: ConceptCode) {
        self.concept = _concept
        super.init(_month: _month,
                _contract: _contract,
                _position: _position,
                _variant: _variant,
                _article: _article)
    }
    public func conceptDescr() -> String {
        String("ConceptCode for \(concept.value)")
    }
}
