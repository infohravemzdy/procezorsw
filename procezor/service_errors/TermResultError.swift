//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

public protocol ITermResultError : Error {
    var target: ITermTarget? { get }
    var article: ArticleCode? { get }
    var concept: ConceptCode? { get }
    var description: String { get }
    func articleDescr() -> String
    func conceptDescr() -> String
}

public enum TermResultError : ITermResultError {
    public func articleDescr() -> String {
        if article?.value == nil {
            return "ARTICLE_NOTFOUND"
        }
        return target?.articleDescr() ?? "CONCEPT_NOTFOUND"
    }

    public func conceptDescr() -> String {
        if concept?.value == nil {
            return "CONCEPT_NOTFOUND"
        }
        return target?.conceptDescr() ?? "CONCEPT_NOTFOUND"
    }

    public var target: ITermTarget? {
        switch (self) {
        case .evalResultError(_, let target, _): return target
        case .extractResultError(_, let target, _): return target
        case .noResultFuncError(_, let target, _): return target
        case .noImplementationError(_, let target, _): return target
        }
    }

    public var article: ArticleCode? {
        switch (self) {
            case .evalResultError(_, let target, _): return target?.article
            case .extractResultError(_, let target, _): return target?.article
            case .noResultFuncError(_, let target, _): return target?.article
            case .noImplementationError(_, let target, _): return target?.article
        }
    }

    public var concept: ConceptCode? {
        switch (self) {
            case .evalResultError(_, let target, _): return target?.concept
            case .extractResultError(_, let target, _): return target?.concept
            case .noResultFuncError(_, let target, _): return target?.concept
            case .noImplementationError(_, let target, _): return target?.concept
        }
    }

    public var description: String {
        switch (self) {
            case .evalResultError(_, _, let description): return description
            case .extractResultError(_, _, let description): return description
            case .noResultFuncError(_, _, let description): return description
            case .noImplementationError(_, _, let description): return description
        }
    }

    case evalResultError(period: IPeriod, target: ITermTarget?, _ message: String)
    case extractResultError(period: IPeriod, target: ITermTarget?, _ message: String)
    case noImplementationError(period: IPeriod, target: ITermTarget?, _ message: String)
    case noResultFuncError(period: IPeriod, target: ITermTarget?, _ message: String)
}

extension TermResultError {
    public static func CreateEvalResultError(period: IPeriod, target: ITermTarget?) -> TermResultError {
        return .evalResultError(period: period, target: target, "evaluation failed")
    }
    public static func CreateExtractResultError(period: IPeriod, target: ITermTarget?) -> TermResultError {
        return .extractResultError(period: period, target: target, "extract result failed")
    }
    public static func CreateNoImplementationError(period: IPeriod, target: ITermTarget?) -> TermResultError {
        return .noImplementationError(period: period, target: target, "failed with no-implementation")
    }
    public static func CreateNoResultFuncError(period: IPeriod, target: ITermTarget) -> TermResultError {
        return .noResultFuncError(period: period, target: target, "failed with no-result function")
    }
}

func ~=<E: ITermResultError & Equatable>(rhs: E, lhs: ITermResultError) -> Bool {
    return (lhs as? E) == rhs
}

