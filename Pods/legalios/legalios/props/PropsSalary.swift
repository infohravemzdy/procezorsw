//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsSalary : PropsBase, IPropsSalary {
    let workingShiftWeek : Int32
    let workingShiftTime : Int32
    let minMonthlyWage : Int32
    let minHourlyWage : Int32

    init(version: VersionId,
         workingShiftWeek : Int32,
         workingShiftTime : Int32,
         minMonthlyWage : Int32,
         minHourlyWage : Int32) {
        self.workingShiftWeek = workingShiftWeek
        self.workingShiftTime = workingShiftTime
        self.minMonthlyWage = minMonthlyWage
        self.minHourlyWage = minHourlyWage
        super.init(version: version)
    }

    convenience init(version: Int16) {
        self.init(version: VersionId.get(value: version),
                workingShiftWeek: 0,
                workingShiftTime: 0,
                minMonthlyWage: 0,
                minHourlyWage: 0)
    }

    static func empty() -> PropsSalary {
        return PropsSalary(version: VERSION_ZERO)
    }
}
