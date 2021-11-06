//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

protocol IResultBuilder {
    var version: VersionCode { get }
    var periodInit: IPeriod { get }
    var articleOrder: Array<ArticleCode> { get }
    var articlePaths: Dictionary<ArticleCode, Array<ArticleDefine>> { get }

    func initWithPeriod(version: VersionCode, period: IPeriod, articleFactory: ArticleSpecFactory, conceptFactory: ConceptSpecFactory) -> Bool
    func getResults(targets: Array<ITermTarget>, finDefs: ArticleDefine) -> BuilderResultList
}
