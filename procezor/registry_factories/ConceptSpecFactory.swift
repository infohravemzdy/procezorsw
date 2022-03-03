//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

protocol IConceptSpecFactory : ISpecFactory where SP : IConceptSpecProvider, SS : IConceptSpec, SC : ConceptCode {
}

class NotFoundConceptSpec : ConceptSpec {
    init (concept: ConceptCode) {
        super.init(concept: concept, path: [ArticleCode](), result: nil)
    }

    convenience init () {
        self.init(concept: ConceptCode.get(ArticleConst.ARTICLE_NOTFOUND.rawValue))
    }
}

class NotFoundConceptProvider : ConceptSpecProvider {
    init () {
        super.init(concept: ConceptCode.get(ArticleConst.ARTICLE_NOTFOUND.rawValue))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return NotFoundConceptSpec(concept: code)
    }
}

class ConceptSpecFactory : SpecFactory<ConceptSpecProvider, ConceptSpec, ConceptCode> {
    init (provList: Array<ConceptSpecProvider>) {
        super.init(provList: provList, defProv: NotFoundConceptProvider(), defSpec: NotFoundConceptSpec())
    }
}