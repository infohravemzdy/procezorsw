//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class TermSymbol : ITermSymbol {
    public let monthCode: MonthCode

    public let contract: ContractCode

    public let position: PositionCode

    public let variant: VariantCode

    public let article: ArticleCode

    init (_month: MonthCode,
          _contract: ContractCode,
          _position: PositionCode,
          _variant: VariantCode,
          _article: ArticleCode) {
        self.monthCode = _month
        self.contract = _contract
        self.position = _position
        self.variant = _variant
        self.article = _article
    }

    convenience init () {
        self.init(_month: MonthCode.new(),
                _contract: ContractCode.new(),
                _position: PositionCode.new(),
                _variant: VariantCode.new(),
                _article: ArticleCode.new())
    }
    public func articleDescr() -> String {
        String("ArticleCode for \(article.value)")
    }
}
