//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

protocol IResultBuilder {
    var version: VersionCode { get }
    var periodInit: IPeriod { get }
    var articleOrder: Array<ArticleTerm> { get }
    var articlePaths: Dictionary<ArticleTerm, Array<ArticleDefine>> { get }

    func initWithPeriod(version: VersionCode, period: IPeriod, articleFactory: ArticleSpecFactory, conceptFactory: ConceptSpecFactory) -> Bool
    func getResults(ruleset: IBundleProps, contractTerms: Array<ContractTerm>, positionTerms: Array<PositionTerm>,
                    targets: ITermTargetList, calcArticles: Array<ArticleCode>) -> BuilderResultList
}
