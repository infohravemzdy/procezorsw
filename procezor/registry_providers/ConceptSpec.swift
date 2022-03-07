//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

public class ConceptSpec : IConceptSpec, Comparable {
    public static func ==(lhs: ConceptSpec, rhs: ConceptSpec) -> Bool {
        lhs.code == rhs.code
    }

    public static func <(lhs: ConceptSpec, rhs: ConceptSpec) -> Bool {
        lhs.code < rhs.code
    }
    public static func constToPathArray(path: Array<Int32>) -> Array<ArticleCode> {
        return path.map { x in return ArticleCode.get(x) }
    }

    public let code: ConceptCode

    public let path: Array<ArticleCode>

    public let resultDelegate: ResultFunc?

    init(concept: ConceptCode, path: Array<ArticleCode>, result: ResultFunc?) {
        self.code = concept
        self.path = path.map { $0 }
        self.resultDelegate = result
    }
    public func defaultTargetList(article: ArticleCode, period: IPeriod, ruleset: IBundleProps, month: MonthCode,
                                  contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
                                  targets: ITermTargetList, vars: VariantCode) -> Array<ITermTarget> {
        let con = ContractCode.zero()
        let pos = PositionCode.zero()

        if (targets.count != 0) {
            return Array<ITermTarget>()
        }
        return [TermTarget(_month: month, _contract: con, _position: pos, _variant: vars, _article: article, _concept: code)]
    }
}
