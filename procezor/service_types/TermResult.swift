//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

public class TermResult : TermSymbol, ITermResult {
    public let target: ITermTarget?

    public let spec: ArticleSpec?

    public let concept: ConceptCode

    init (_target: ITermTarget?, _spec: ArticleSpec?) {
        self.target = _target
        self.spec = _spec

        let _monthCode = target?.monthCode ?? MonthCode.new()
        let _contract = target?.contract ?? ContractCode.new()
        let _position = target?.position ?? PositionCode.new()
        let _variant = target?.variant ?? VariantCode.new()
        let _article = target?.article ?? ArticleCode.new()
        let _concept = target?.concept ?? ConceptCode.new()

        self.concept = _concept

        super.init(_month: _monthCode,
                _contract: _contract,
                _position: _position,
                _variant: _variant,
                _article: _article)
    }
    public func conceptDescr() -> String {
        String("ConceptCode for \(concept.value)")
    }
}
