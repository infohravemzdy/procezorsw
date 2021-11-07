//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class ConceptSpec : IConceptSpec, Comparable {
    public static func ==(lhs: ConceptSpec, rhs: ConceptSpec) -> Bool {
        lhs.code == rhs.code
    }

    public static func <(lhs: ConceptSpec, rhs: ConceptSpec) -> Bool {
        lhs.code < rhs.code
    }
    public static func constToPathArray(path: Array<Int32>) -> Array<ArticleCode> {
        return path.map { x in return ArticleCode.get(x) }
    }

    public let code: ConceptCode

    public let path: Array<ArticleCode>

    public let resultDelegate: ResultFunc?

    init(concept: ConceptCode, path: Array<ArticleCode>, result: ResultFunc?) {
        self.code = concept
        self.path = path.map { $0 }
        self.resultDelegate = result
    }
}
