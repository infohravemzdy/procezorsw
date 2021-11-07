//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsHealth : PropsBase, IPropsHealth {
    let minMonthlyBasis: Int32
    let maxAnnualsBasis: Int32
    let limMonthlyState: Int32
    let limMonthlyDis50: Int32
    let factorCompound: Decimal
    let factorEmployee: Decimal
    let marginIncomeEmp: Int32
    let marginIncomeAgr: Int32

    init(version: VersionId,
         minMonthlyBasis: Int32,
         maxAnnualsBasis: Int32,
         limMonthlyState: Int32,
         limMonthlyDis50: Int32,
         factorCompound: Decimal,
         factorEmployee: Decimal,
         marginIncomeEmp: Int32,
         marginIncomeAgr: Int32) {
        self.minMonthlyBasis = minMonthlyBasis
        self.maxAnnualsBasis = maxAnnualsBasis
        self.limMonthlyState = limMonthlyState
        self.limMonthlyDis50 = limMonthlyDis50
        self.factorCompound = factorCompound
        self.factorEmployee = factorEmployee
        self.marginIncomeEmp = marginIncomeEmp
        self.marginIncomeAgr = marginIncomeAgr
        super.init(version: version)
    }

    convenience init(version: Int16) {
        self.init(version: VersionId.get(value: version),
                minMonthlyBasis: 0,
                maxAnnualsBasis: 0,
                limMonthlyState: 0,
                limMonthlyDis50: 0,
                factorCompound: Decimal.zero,
                factorEmployee: Decimal.zero,
                marginIncomeEmp: 0,
                marginIncomeAgr: 0)
    }

    static func empty() -> PropsHealth {
        return PropsHealth(version: VERSION_ZERO)
    }
}
