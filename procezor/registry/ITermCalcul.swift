//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

protocol ITermCalcul : ITermSymbol {
    var target: ITermTarget { get }
    var spec: ArticleSpec? { get }
    var resultDelegate: ResultFunc? { get }
    func getResults(period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList
}
