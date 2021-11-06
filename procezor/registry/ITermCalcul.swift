//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

protocol ITermCalcul : ITermSymbol {
    var target: ITermTarget { get }
    var resultDelegate: ResultFunc? { get }
    func getResults(period: IPeriod, results: BuilderResultList) -> BuilderResultList
}
