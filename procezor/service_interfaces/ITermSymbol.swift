//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public protocol ITermSymbol {
    var monthCode : MonthCode { get }
    var contract: ContractCode { get }
    var position: PositionCode { get }
    var variant : VariantCode { get }
    var article : ArticleCode { get }
    func articleDescr() -> String
}
