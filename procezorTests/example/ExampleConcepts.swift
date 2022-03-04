//
// Created by Ladislav Lisy on 03.03.2022.
//

import Foundation

@testable import legalios
@testable import procezor

public class ExampleConceptSpec : ConceptSpec {
    override init(concept: ConceptCode, path: Array<ArticleCode>, result: ResultFunc?) {
        super.init(concept: concept, path: path, result: result)
    }
    convenience init(code: Int32) {
        self.init(concept: ConceptCode.get(code), path: [], result: nil)
    }
}

class ExampleTermTarget : TermTarget {
    override init (_month: MonthCode,
                   _contract: ContractCode,
                   _position: PositionCode,
                   _variant: VariantCode,
                   _article: ArticleCode,
                   _concept: ConceptCode) {
        super.init(_month: _month,
                _contract: _contract,
                _position: _position,
                _variant: _variant,
                _article: _article,
                _concept: _concept)
    }
    public override func articleDescr() -> String {
        getArticleSymbol(item: article.value)
    }

    public override func conceptDescr() -> String {
        getConceptSymbol(item: concept.value)
    }
}

class ExampleTermResult : TermResult {
    override init(_target: ITermTarget?, _spec: ArticleSpec?) {
        super.init(_target: _target, _spec: _spec)
    }
    public override func articleDescr() -> String {
        getArticleSymbol(item: article.value)
    }

    public override func conceptDescr() -> String {
        getConceptSymbol(item: concept.value)
    }
}

