//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

public typealias ResultFunc = (ITermTarget, ArticleSpec?, IPeriod, IBundleProps, BuilderResultList) -> BuilderResultList

public protocol IConceptSpec : ISpecDefine {
    var code : ConceptCode { get }
    var path : Array<ArticleCode> { get }
    var resultDelegate : ResultFunc? { get }
    func defaultTargetList(article: ArticleCode, period: IPeriod, ruleset: IBundleProps, month: MonthCode,
                           contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
                           targets: ITermTargetList, vars: VariantCode) -> Array<ITermTarget>
}
