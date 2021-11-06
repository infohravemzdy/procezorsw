//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

class TermCalcul : TermSymbol, ITermCalcul {
    var target: ITermTarget

    var resultDelegate: ResultFunc?

    init (target: ITermTarget, resultDelegate: ResultFunc?) {
        self.target = target
        self.resultDelegate = resultDelegate

        super.init(_month: target.monthCode, _contract: target.contract, _position: target.position,
                _variant: target.variant, _article: target.article)
    }
    func getResults(period: IPeriod, results: BuilderResultList) -> BuilderResultList {
        if (resultDelegate == nil) {
            let resultError = TermResultError.CreateNoResultFuncError(period: period, target: target)
            return [.failure(resultError)]
        }
        var resultTarget = resultDelegate!(target, period, results)

        return resultTarget.map { $0 }
    }
}
