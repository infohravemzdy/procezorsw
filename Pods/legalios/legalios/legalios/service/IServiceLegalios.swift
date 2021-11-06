//
// Created by Ladislav Lisy on 30.06.2021.
//

import Foundation

protocol IServiceLegalios {
    func getBundle(_ period: IPeriod) -> Result<IBundleProps, HistoryResultError>
}
