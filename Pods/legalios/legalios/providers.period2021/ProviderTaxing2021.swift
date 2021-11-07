//
// Created by Ladislav Lisy on 29.06.2021.
//

import Foundation

class ProviderTaxing2021: ProviderTaxing {
    init() {
        super.init(versionId: HistoryConstTaxing2021.VERSION_CODE)
    }

    override func getProps<P>(_ period: IPeriod) -> P {
        return PropsTaxing(version: version,
                allowancePayer: allowancePayer(period),
                allowanceDisab1st: allowanceDisab1st(period),
                allowanceDisab2nd: allowanceDisab2nd(period),
                allowanceDisab3rd: allowanceDisab3rd(period),
                allowanceStudy: allowanceStudy(period),
                allowanceChild1st: allowanceChild1st(period),
                allowanceChild2nd: allowanceChild2nd(period),
                allowanceChild3rd: allowanceChild3rd(period),
                factorAdvances: factorAdvances(period),
                factorWithhold: factorWithhold(period),
                factorSolitary: factorSolitary(period),
                minAmountOfTaxBonus: minAmountOfTaxBonus(period),
                maxAmountOfTaxBonus: maxAmountOfTaxBonus(period),
                marginIncomeOfTaxBonus: marginIncomeOfTaxBonus(period),
                marginIncomeOfRounding: marginIncomeOfRounding(period),
                marginIncomeOfWithhold: marginIncomeOfWithhold(period),
                marginIncomeOfSolitary: marginIncomeOfSolitary(period),
                marginIncomeOfWthEmp: marginIncomeOfWthEmp(period),
                marginIncomeOfWthAgr: marginIncomeOfWthAgr(period))  as! P
    }

    override func allowancePayer(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.ALLOWANCE_PAYER
    }

    override func allowanceDisab1st(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.ALLOWANCE_DISAB_1ST
    }

    override func allowanceDisab2nd(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.ALLOWANCE_DISAB_2ND
    }

    override func allowanceDisab3rd(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.ALLOWANCE_DISAB_3RD
    }

    override func allowanceStudy(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.ALLOWANCE_STUDY
    }

    override func allowanceChild1st(_ period: IPeriod) -> Int32  {
        return HistoryConstTaxing2021.ALLOWANCE_CHILD_1ST
    }

    override func allowanceChild2nd(_ period: IPeriod) -> Int32  {
        return HistoryConstTaxing2021.ALLOWANCE_CHILD_2ND
    }

    override func allowanceChild3rd(_ period: IPeriod) -> Int32  {
        return HistoryConstTaxing2021.ALLOWANCE_CHILD_3RD
    }

    override func factorAdvances(_ period: IPeriod) -> Decimal {
        return HistoryConstTaxing2021.FACTOR_ADVANCES
    }

    override func factorWithhold(_ period: IPeriod) -> Decimal {
        return HistoryConstTaxing2021.FACTOR_WITHHOLD
    }

    override func factorSolitary(_ period: IPeriod) -> Decimal {
        return HistoryConstTaxing2021.FACTOR_SOLITARY
    }

    override func minAmountOfTaxBonus(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.MIN_AMOUNT_OF_TAXBONUS
    }

    override func maxAmountOfTaxBonus(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.MAX_AMOUNT_OF_TAXBONUS
    }

    override func marginIncomeOfTaxBonus(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.MARGIN_INCOME_OF_TAXBONUS
    }

    override func marginIncomeOfRounding(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.MARGIN_INCOME_OF_ROUNDING
    }

    override func marginIncomeOfWithhold(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.MARGIN_INCOME_OF_WITHHOLD
    }

    override func marginIncomeOfSolitary(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.MARGIN_INCOME_OF_SOLITARY
    }

    override func marginIncomeOfWthEmp(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.MARGIN_INCOME_OF_WHT_EMP
    }

    override func marginIncomeOfWthAgr(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2021.MARGIN_INCOME_OF_WHT_AGR
    }
}
