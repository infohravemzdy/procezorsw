//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsTaxing : PropsBase, IPropsTaxing {
    let allowancePayer: Int32
    let allowanceDisab1st: Int32
    let allowanceDisab2nd : Int32
    let allowanceDisab3rd: Int32
    let allowanceStudy: Int32
    let allowanceChild1st: Int32
    let allowanceChild2nd: Int32
    let allowanceChild3rd: Int32
    let factorAdvances: Decimal
    let factorWithhold: Decimal
    let factorSolitary: Decimal
    let minAmountOfTaxBonus: Int32
    let maxAmountOfTaxBonus: Int32
    let marginIncomeOfTaxBonus: Int32
    let marginIncomeOfRounding: Int32
    let marginIncomeOfWithhold: Int32
    let marginIncomeOfSolitary: Int32
    let marginIncomeOfWthEmp: Int32
    let marginIncomeOfWthAgr: Int32

    init(version: VersionId,
        allowancePayer: Int32,
        allowanceDisab1st: Int32,
        allowanceDisab2nd : Int32,
        allowanceDisab3rd: Int32,
        allowanceStudy: Int32,
        allowanceChild1st: Int32,
        allowanceChild2nd: Int32,
        allowanceChild3rd: Int32,
        factorAdvances: Decimal,
        factorWithhold: Decimal,
        factorSolitary: Decimal,
        minAmountOfTaxBonus: Int32,
        maxAmountOfTaxBonus: Int32,
        marginIncomeOfTaxBonus: Int32,
        marginIncomeOfRounding: Int32,
        marginIncomeOfWithhold: Int32,
        marginIncomeOfSolitary: Int32,
        marginIncomeOfWthEmp: Int32,
        marginIncomeOfWthAgr: Int32) {
        self.allowancePayer = allowancePayer
        self.allowanceDisab1st = allowanceDisab1st
        self.allowanceDisab2nd = allowanceDisab2nd
        self.allowanceDisab3rd = allowanceDisab3rd
        self.allowanceStudy = allowanceStudy
        self.allowanceChild1st = allowanceChild1st
        self.allowanceChild2nd = allowanceChild2nd
        self.allowanceChild3rd = allowanceChild3rd
        self.factorAdvances = factorAdvances
        self.factorWithhold = factorWithhold
        self.factorSolitary = factorSolitary
        self.minAmountOfTaxBonus = minAmountOfTaxBonus
        self.maxAmountOfTaxBonus = maxAmountOfTaxBonus
        self.marginIncomeOfTaxBonus = marginIncomeOfTaxBonus
        self.marginIncomeOfRounding = marginIncomeOfRounding
        self.marginIncomeOfWithhold = marginIncomeOfWithhold
        self.marginIncomeOfSolitary = marginIncomeOfSolitary
        self.marginIncomeOfWthEmp = marginIncomeOfWthEmp
        self.marginIncomeOfWthAgr = marginIncomeOfWthAgr
        super.init(version: version)
    }

    convenience init(version: Int16) {
        self.init(version: VersionId.get(value: version),
                allowancePayer: 0,
                allowanceDisab1st: 0,
                allowanceDisab2nd: 0,
                allowanceDisab3rd: 0,
                allowanceStudy: 0,
                allowanceChild1st: 0,
                allowanceChild2nd: 0,
                allowanceChild3rd: 0,
                factorAdvances: Decimal.zero,
                factorWithhold: Decimal.zero,
                factorSolitary: Decimal.zero,
                minAmountOfTaxBonus: 0,
                maxAmountOfTaxBonus: 0,
                marginIncomeOfTaxBonus: 0,
                marginIncomeOfRounding: 0,
                marginIncomeOfWithhold: 0,
                marginIncomeOfSolitary: 0,
                marginIncomeOfWthEmp: 0,
                marginIncomeOfWthAgr: 0)
    }

    static func empty() -> PropsTaxing {
        return PropsTaxing(version: VERSION_ZERO)
    }
}
