//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

protocol ISpecFactory {
    associatedtype SP : ISpecProvider
    associatedtype SS : ISpecDefine
    associatedtype SC : ISpecCode

    func getSpec(code: SC, period: IPeriod, version: VersionCode) -> SS
    func getSpecList(period: IPeriod, version: VersionCode) -> Array<SS>
}
