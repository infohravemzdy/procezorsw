//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class BundleProps : IBundleProps {
    init(periodProps: IPeriod,
        salaryProps: IPropsSalary,
        healthProps: IPropsHealth,
        socialProps: IPropsSocial,
        taxingProps: IPropsTaxing)
    {
        self.periodProps = periodProps
        self.salaryProps = salaryProps
        self.healthProps = healthProps
        self.socialProps = socialProps
        self.taxingProps = taxingProps
    }

    let periodProps: IPeriod
    let salaryProps: IPropsSalary?
    let healthProps: IPropsHealth?
    let socialProps: IPropsSocial?
    let taxingProps: IPropsTaxing?

    func getPeriodYear() -> Int16 {
        return periodProps.year
    }

    func getPeriodMonth() -> Int16 {
        return periodProps.month
    }
    func getPeriodCode() -> Int32 {
        return periodProps.code
    }

}