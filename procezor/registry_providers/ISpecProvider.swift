//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

protocol ISpecProvider {
    associatedtype S
    associatedtype C : ISpecCode
    var code: C { get }
    func getSpec(period: IPeriod, version: VersionCode) -> S
}
