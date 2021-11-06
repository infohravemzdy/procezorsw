//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

protocol IServiceProcezor {
    var version: VersionCode { get }
    var finDefs: ArticleDefine { get }
    func getResults(period: IPeriod, targets: ITermTargetList) -> BuilderResultList
    func initWithPeriod(period: IPeriod) -> Bool
    func buildFactories() -> Bool
    func getArticleSpec(code: ArticleCode, period: IPeriod, version: VersionCode) -> ArticleSpec?
    func getConceptSpec(code: ConceptCode, period: IPeriod, version: VersionCode) -> ConceptSpec?
}
