//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public typealias ResultFunc = (ITermTarget, IPeriod, BuilderResultList) -> BuilderResultList

public protocol IConceptSpec : ISpecDefine {
    var code : ConceptCode { get }
    var path : Array<ArticleCode> { get }
    var resultDelegate : ResultFunc? { get }
}
