//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

protocol IServiceProcezor {
    var version: VersionCode { get }
    var calcArticles: Array<ArticleCode> { get }
    func builderOrder() -> Array<ArticleTerm>
    func builderPaths() -> Dictionary<ArticleTerm, Array<ArticleDefine>>

    func getContractTerms(period: IPeriod, targets: ITermTargetList) -> Array<ContractTerm>
    func getPositionTerms(period: IPeriod, contracts: Array<ContractTerm>, targets: ITermTargetList) -> Array<PositionTerm>

    func getResults(period: IPeriod, ruleset: IBundleProps, targets: ITermTargetList) -> BuilderResultList
    func initWithPeriod(period: IPeriod) -> Bool
    func buildFactories() -> Bool
    func getArticleSpec(code: ArticleCode, period: IPeriod, version: VersionCode) -> ArticleSpec?
    func getConceptSpec(code: ConceptCode, period: IPeriod, version: VersionCode) -> ConceptSpec?
}
