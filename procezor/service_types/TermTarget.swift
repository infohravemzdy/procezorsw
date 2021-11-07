//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class TermTarget : TermSymbol, ITermTarget {
    public let concept: ConceptCode

    public let targetBasis: Int32

    public let targetDescr: String

    public func defs() -> ArticleDefine {
        return ArticleDefine(code: article, role: concept)
    }

    init (_month: MonthCode,
          _contract: ContractCode,
          _position: PositionCode,
          _variant: VariantCode,
          _article: ArticleCode,
          _concept: ConceptCode,
          _basis: Int32,
          _descr: String) {
        self.concept = _concept
        self.targetBasis = _basis
        self.targetDescr = _descr
        super.init(_month: _month,
                _contract: _contract,
                _position: _position,
                _variant: _variant,
                _article: _article)
    }
    convenience init (_month: MonthCode,
                      _contract: ContractCode,
                      _position: PositionCode,
                      _variant: VariantCode,
                      _article: ArticleCode,
                      _concept: ConceptCode) {
        self.init(_month: _month,
                _contract: _contract,
                _position: _position,
                _variant: _variant,
                _article: _article,
                _concept: _concept,
                _basis: 0,
                _descr: "")
    }
    public func conceptDescr() -> String {
        String("ConceptCode for \(concept.value)")
    }
}
