//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

public typealias ResultFunc = (ITermTarget, IPeriod, IBundleProps, BuilderResultList) -> BuilderResultList

public protocol IConceptSpec : ISpecDefine {
    var code : ConceptCode { get }
    var path : Array<ArticleCode> { get }
    var resultDelegate : ResultFunc? { get }
}
