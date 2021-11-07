//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation
import legalios

typealias CODE = Int32

class SpecFactory<FP : ISpecProvider, FS : ISpecDefine, FC : ISpecCode> : ISpecFactory {
    typealias SP = FP
    typealias SS = FS
    typealias SC = FC

    let providers: Dictionary<CODE, FP>
    let notFoundProvider: FP
    let notFoundSpec: FS

    init (provList:  Array<FP>, defProv: FP, defSpec: FS) {
        self.providers = provList.reduce(into: [CODE: FP]()) {
            $0[$1.code.value] = $1
        }
        notFoundProvider = defProv
        notFoundSpec = defSpec
    }

    func getSpec(code: FC, period: IPeriod, version: VersionCode) -> FS {
        let provider: FP = getProvider(code: code, defProvider: notFoundProvider)
        return provider.getSpec(period: period, version: version) as! FS
    }

    func getSpecList(period: IPeriod, version: VersionCode) -> Array<FS> {
        return providers.map {$0.value.getSpec(period: period, version: version) as! FS}
    }

    func getProvider(code: FC, defProvider: FP) -> FP {
        let maybeProvider: FP? = providers[code.value]
        if (maybeProvider == nil) {
            return defProvider
        }
        let provider: FP = maybeProvider!
        return provider
    }
}