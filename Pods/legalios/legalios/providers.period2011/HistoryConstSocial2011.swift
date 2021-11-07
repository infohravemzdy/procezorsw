//
// Created by Ladislav Lisy on 13.06.2021.
//

// MAX_ANNUALS_BASIS            Maximální roční vyměřovací základ na jednoho pracovníka (tzv.strop)
//
// FACTOR_EMPLOYER              Sazba - standardní sociálního pojištění - zaměstnavatele
//
// FACTOR_EMPLOYER_HIGHER       Sazba - vyší sociálního pojištění - zaměstnavatele
//
// FACTOR_EMPLOYEE              Sazba sociálního pojištění - zaměstnance
//
// FACTOR_EMPLOYEE_REDUCE       Snížení sazby sociálního pojištění - zaměstnance - s důchodovým spořením
//
// FACTOR_EMPLOYEE_GARANT       Sazba důchodového spoření - zaměstnance - s důchodovým spořením
//
// MARGIN_INCOME_EMP            hranice příjmu pro vznik účasti na pojištění pro zaměstnace v pracovním poměru
//
// MARGIN_INCOME_AGR            hranice příjmu pro vznik účasti na pojištění pro zaměstnace na dohodu

import Foundation

struct HistoryConstSocial2011
{
    static let VERSION_CODE: Int16 = 2011

    static let MAX_ANNUALS_BASIS: Int32 = 1781280
    static let FACTOR_EMPLOYER: Decimal =  Decimal(string: "25.0")!
    static let FACTOR_EMPLOYER_HIGHER: Decimal =  Decimal(string: "26.0")!
    static let FACTOR_EMPLOYEE: Decimal =  Decimal(string: "6.5")!
    static let FACTOR_EMPLOYEE_REDUCE: Decimal =  Decimal(string: "0.0")!
    static let FACTOR_EMPLOYEE_GARANT: Decimal =  Decimal(string: "0.0")!
    static let MARGIN_INCOME_EMP: Int32 = 2000
    static let MARGIN_INCOME_AGR: Int32 = MARGIN_INCOME_EMP
}
