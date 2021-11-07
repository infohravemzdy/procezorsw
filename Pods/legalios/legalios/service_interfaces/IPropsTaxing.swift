//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

public protocol IPropsTaxing : IProps {
    var allowancePayer: Int32 { get }
    var allowanceDisab1st: Int32 { get }
    var allowanceDisab2nd : Int32 { get }
    var allowanceDisab3rd: Int32 { get }
    var allowanceStudy: Int32 { get }
    var allowanceChild1st: Int32 { get }
    var allowanceChild2nd: Int32 { get }
    var allowanceChild3rd: Int32 { get }
    var factorAdvances: Decimal { get }
    var factorWithhold: Decimal { get }
    var factorSolitary: Decimal { get }
    var minAmountOfTaxBonus: Int32 { get }
    var maxAmountOfTaxBonus: Int32 { get }
    var marginIncomeOfTaxBonus: Int32 { get }
    var marginIncomeOfRounding: Int32 { get }
    var marginIncomeOfWithhold: Int32 { get }
    var marginIncomeOfSolitary: Int32 { get }
    var marginIncomeOfWthEmp: Int32 { get }
    var marginIncomeOfWthAgr: Int32 { get }
}
