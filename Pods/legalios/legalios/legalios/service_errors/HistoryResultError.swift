//
// Created by Ladislav Lisy on 30.06.2021.
//

import Foundation

public protocol IHistoryResultError : Error {

}

public enum HistoryResultError : IHistoryResultError {
    case bundleNoneError(_ message: String)
    case bundleNullError(_ message: String)
    case bundleEmptyError(_ message: String)
    case bundleInvalidError(_ message: String)
}

extension HistoryResultError {
    public static func CreateBundleNoneError() -> HistoryResultError {
        return .bundleNoneError("service hasn't returned bundle")
    }
    public static func CreateBundleNullError() -> HistoryResultError {
        return .bundleNullError("service returned null bundle")
    }
    public static func CreateBundleEmptyError() -> HistoryResultError {
        return .bundleEmptyError("service returned empty bundle")
    }
    public static func CreateBundleInvalidError() -> HistoryResultError {
        return .bundleInvalidError("service returned invalid bundle")
    }
}

func ~=<E: IHistoryResultError & Equatable>(rhs: E, lhs: IHistoryResultError) -> Bool {
    return (lhs as? E) == rhs
}

