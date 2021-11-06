//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class TermResult : TermSymbol, ITermResult {
    public let target: ITermTarget?

    public let concept: ConceptCode

    public let resultValue: Int32

    public let resultBasis: Int32

    public let resultDescr: String

    init (_target: ITermTarget?,
          _value: Int32,
          _basis: Int32,
          _descr: String) {
        self.target = _target

        let _monthCode = target?.monthCode ?? MonthCode.new()
        let _contract = target?.contract ?? ContractCode.new()
        let _position = target?.position ?? PositionCode.new()
        let _variant = target?.variant ?? VariantCode.new()
        let _article = target?.article ?? ArticleCode.new()
        let _concept = target?.concept ?? ConceptCode.new()

        self.concept = _concept
        self.resultValue = _value
        self.resultBasis = _basis
        self.resultDescr = _descr

        super.init(_month: _monthCode,
                _contract: _contract,
                _position: _position,
                _variant: _variant,
                _article: _article)
    }
    public override func conceptDescr() -> String {
        String("ConceptCode for \(concept.value)")
    }
}
