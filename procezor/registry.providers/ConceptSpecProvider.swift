//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

protocol IConceptSpecProvider: ISpecProvider {
    typealias S = ConceptSpec
    typealias C = ConceptCode
}

class ConceptSpecProvider : IConceptSpecProvider {
    let code: ConceptCode

    init (concept: ConceptCode) {
        self.code = concept
    }

    convenience init (codeInt: Int32) {
        self.init(concept: ConceptCode.get(codeInt))
    }

    func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        fatalError("getSpec(period:version:) has not been implemented")
    }
}
