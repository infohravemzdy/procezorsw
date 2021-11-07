//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

public protocol IPropsSocial : IProps {
    var maxAnnualsBasis: Int32 { get }
    var factorEmployer: Decimal { get }
    var factorEmployerHigher: Decimal { get }
    var factorEmployee: Decimal { get }
    var factorEmployeeGarant: Decimal { get }
    var factorEmployeeReduce: Decimal { get }
    var marginIncomeEmp: Int32 { get }
    var marginIncomeAgr: Int32 { get }
}
