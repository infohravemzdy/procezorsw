//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public protocol ITermTarget : ITermSymbol {
    var concept : ConceptCode { get }
    var targetBasis : Int32 { get }
    var targetDescr : String { get }
    func defs() -> ArticleDefine
    func conceptDescr() -> String
}

public typealias ITermTargetList = Array<ITermTarget>