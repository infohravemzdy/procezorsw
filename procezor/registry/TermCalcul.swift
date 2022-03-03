//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

class TermCalcul : TermSymbol, ITermCalcul {
    var target: ITermTarget

    var spec: ArticleSpec?

    var resultDelegate: ResultFunc?

    init (target: ITermTarget, spec: ArticleSpec?, resultDelegate: ResultFunc?) {
        self.target = target
        self.spec = spec
        self.resultDelegate = resultDelegate

        super.init(_month: target.monthCode, _contract: target.contract, _position: target.position,
                _variant: target.variant, _article: target.article)
    }
    func getResults(period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        if (resultDelegate == nil) {
            let resultError = TermResultError.CreateNoResultFuncError(period: period, target: target)
            return [.failure(resultError)]
        }
        let resultTarget = resultDelegate!(target, spec, period, ruleset, results)

        return resultTarget.map { $0 }
    }
}
