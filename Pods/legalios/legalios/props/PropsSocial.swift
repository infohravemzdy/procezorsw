//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsSocial : PropsBase, IPropsSocial {
    let maxAnnualsBasis: Int32
    let factorEmployer: Decimal
    let factorEmployerHigher: Decimal
    let factorEmployee: Decimal
    let factorEmployeeGarant: Decimal
    let factorEmployeeReduce: Decimal
    let marginIncomeEmp: Int32
    let marginIncomeAgr: Int32

    init(version: VersionId,
         maxAnnualsBasis: Int32,
         factorEmployer: Decimal,
         factorEmployerHigher: Decimal,
         factorEmployee: Decimal,
         factorEmployeeGarant: Decimal,
         factorEmployeeReduce: Decimal,
         marginIncomeEmp: Int32,
         marginIncomeAgr: Int32) {
        self.maxAnnualsBasis = maxAnnualsBasis
        self.factorEmployer = factorEmployer
        self.factorEmployerHigher = factorEmployerHigher
        self.factorEmployee = factorEmployee
        self.factorEmployeeGarant = factorEmployeeGarant
        self.factorEmployeeReduce = factorEmployeeReduce
        self.marginIncomeEmp = marginIncomeEmp
        self.marginIncomeAgr = marginIncomeAgr
        super.init(version: version)
    }

    convenience init(version: Int16) {
        self.init(version: VersionId.get(value: version),
                maxAnnualsBasis: 0,
                factorEmployer: Decimal.zero,
                factorEmployerHigher: Decimal.zero,
                factorEmployee: Decimal.zero,
                factorEmployeeGarant: Decimal.zero,
                factorEmployeeReduce: Decimal.zero,
                marginIncomeEmp: 0,
                marginIncomeAgr: 0)
    }

    static func empty() -> PropsSocial {
        return PropsSocial(version: VERSION_ZERO)
    }
}
