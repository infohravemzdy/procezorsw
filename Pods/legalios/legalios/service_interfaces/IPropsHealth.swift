//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

public protocol IPropsHealth : IProps {
    var minMonthlyBasis: Int32 { get }
    var maxAnnualsBasis: Int32 { get }
    var limMonthlyState: Int32 { get }
    var limMonthlyDis50: Int32 { get }
    var factorCompound: Decimal { get }
    var factorEmployee: Decimal { get }
    var marginIncomeEmp: Int32 { get }
    var marginIncomeAgr: Int32 { get }
}
