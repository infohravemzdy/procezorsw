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
        case .invalidResultError(_, let target, _): return target
        case .invalidRulesetError(_, let target, _): return target
        case .invalidTargetError(_, let target, _): return target
        case .noResultFoundError(_, let target, _): return target
        case .nullResultFoundError(_, let target, _): return target
        }
    }

    public var article: ArticleCode? {
        switch (self) {
            case .evalResultError(_, let target, _): return target?.article
            case .extractResultError(_, let target, _): return target?.article
            case .noResultFuncError(_, let target, _): return target?.article
            case .noImplementationError(_, let target, _): return target?.article
            case .invalidResultError(_, let target, _): return target?.article
            case .invalidRulesetError(_, let target, _): return target?.article
            case .invalidTargetError(_, let target, _): return target?.article
            case .noResultFoundError(_, let target, _): return target?.article
            case .nullResultFoundError(_, let target, _): return target?.article
        }
    }

    public var concept: ConceptCode? {
        switch (self) {
            case .evalResultError(_, let target, _): return target?.concept
            case .extractResultError(_, let target, _): return target?.concept
            case .noResultFuncError(_, let target, _): return target?.concept
            case .noImplementationError(_, let target, _): return target?.concept
            case .invalidResultError(_, let target, _): return target?.concept
            case .invalidRulesetError(_, let target, _): return target?.concept
            case .invalidTargetError(_, let target, _): return target?.concept
            case .noResultFoundError(_, let target, _): return target?.concept
            case .nullResultFoundError(_, let target, _): return target?.concept
        }
    }

    public var description: String {
        switch (self) {
            case .evalResultError(_, _, let description): return description
            case .extractResultError(_, _, let description): return description
            case .noResultFuncError(_, _, let description): return description
            case .noImplementationError(_, _, let description): return description
            case .invalidResultError(_, _, let description): return description
            case .invalidRulesetError(_, _, let description): return description
            case .invalidTargetError(_, _, let description): return description
            case .noResultFoundError(_, _, let description): return description
            case .nullResultFoundError(_, _, let description): return description
        }
    }

    case evalResultError(period: IPeriod, target: ITermTarget?, _ message: String)
    case extractResultError(period: IPeriod, target: ITermTarget?, _ message: String)
    case noImplementationError(period: IPeriod, target: ITermTarget?, _ message: String)
    case noResultFuncError(period: IPeriod, target: ITermTarget?, _ message: String)
    case invalidResultError(period: IPeriod, target: ITermTarget?, _ message: String)
    case invalidRulesetError(period: IPeriod, target: ITermTarget?, _ message: String)
    case invalidTargetError(period: IPeriod, target: ITermTarget?, _ message: String)
    case noResultFoundError(period: IPeriod, target: ITermTarget?, _ message: String)
    case nullResultFoundError(period: IPeriod, target: ITermTarget?, _ message: String)

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
    public static func CreateInvalidResultError(period: IPeriod, target: ITermTarget, _ typeDesr: String) -> TermResultError {
        return .invalidResultError(period: period, target: target, "invalid result type \(typeDesr) error!")
    }
    public static func CreateInvalidRulesetError(period: IPeriod, target: ITermTarget, _ typeDesr: String) -> TermResultError {
        return .invalidRulesetError(period: period, target: target, "Invalid \(typeDesr) Ruleset error!")
    }
    public static func CreateInvalidTargetError(period: IPeriod, target: ITermTarget, _ typeDesr: String) -> TermResultError {
        return .invalidTargetError(period: period, target: target, "Invalid target type \(typeDesr) error!")
    }
    public static func CreateNoResultFoundError(period: IPeriod, target: ITermTarget, _ article: String) -> TermResultError {
        return .noResultFoundError(period: period, target: target, "Result for \(article) Not Found")
    }
    public static func CreateNoResultFoundError(period: IPeriod, target: ITermTarget, _ article: String, _ contract: ContractCode) -> TermResultError {
        return .noResultFoundError(period: period, target: target, "Result for \(article), contract=\(contract.value) Not Found")
    }
    public static func CreateNoResultFoundError(period: IPeriod, target: ITermTarget, _ article: String, _ contract: ContractCode, _ position: PositionCode) -> TermResultError {
        return .noResultFoundError(period: period, target: target, "Result for \(article), contract=\(contract.value), position=\(position.value) Not Found")
    }
    public static func CreateNullResultFoundError(period: IPeriod, target: ITermTarget, _ article: String) -> TermResultError {
        return .nullResultFoundError(period: period, target: target, "Result found for \(article) but Instance is Null!")
    }
    public static func CreateNullResultFoundError(period: IPeriod, target: ITermTarget, _ article: String, _ contract: ContractCode) -> TermResultError {
        return .nullResultFoundError(period: period, target: target, "Result found for \(article), contract=\(contract.value) but Instance is Null!")
    }
    public static func CreateNullResultFoundError(period: IPeriod, target: ITermTarget, _ article: String, _ contract: ContractCode, _ position: PositionCode) -> TermResultError {
        return .nullResultFoundError(period: period, target: target, "Result found for \(article), contract=\(contract.value), position=\(position.value) but Instance is Null!")
    }
}

func ~=<E: ITermResultError & Equatable>(rhs: E, lhs: ITermResultError) -> Bool {
    return (lhs as? E) == rhs
}

