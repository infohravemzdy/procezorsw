//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public protocol ITermResult : ITermSymbol {
    var concept : ConceptCode { get }
    var resultDescr : String { get }
    var resultBasis : Int32 { get }
    var resultValue : Int32 { get }
    func articleDescr() -> String
    func conceptDescr() -> String
}
