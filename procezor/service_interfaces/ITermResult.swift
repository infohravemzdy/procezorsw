//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public protocol ITermResult : ITermSymbol {
    var concept : ConceptCode { get }
    var spec : ArticleSpec? { get }
    func articleDescr() -> String
    func conceptDescr() -> String
}

public typealias ITermResultList = Array<ITermResult>