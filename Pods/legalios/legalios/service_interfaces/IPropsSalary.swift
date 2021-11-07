//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

public protocol IPropsSalary : IProps {
    var workingShiftWeek : Int32 { get }
    var workingShiftTime : Int32 { get }
    var minMonthlyWage : Int32 { get }
    var minHourlyWage : Int32 { get }
}
