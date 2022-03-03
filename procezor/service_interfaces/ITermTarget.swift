//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public protocol ITermTarget : ITermSymbol {
    var concept : ConceptCode { get }
    func conceptDescr() -> String
}

public typealias ITermTargetList = Array<ITermTarget>