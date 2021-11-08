//
// Created by Ladislav Lisy on 05.11.2021.
//

import Foundation
import  legalios

class TimeshtWorkingArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_TIMESHT_WORKING.rawValue
    init() {
        super.init(article: ArticleCode.get(TimeshtWorkingArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        TimeshtWorkingArtSpec(_code: code)
    }
}

class TimeshtWorkingArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TIMESHT_WORKING.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_TIMESHT_WORKING.rawValue
        ))
    }
}

class PaymentSalaryArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_PAYMENT_SALARY.rawValue
    init() {
        super.init(article: ArticleCode.get(PaymentSalaryArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        PaymentSalaryArtSpec(_code: code)
    }
}

class PaymentSalaryArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_BASIS.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_PAYMENT_SALARY.rawValue
        ))
    }
}

class PaymentBonusArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_PAYMENT_BONUS.rawValue
    init() {
        super.init(article: ArticleCode.get(PaymentBonusArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        PaymentBonusArtSpec(_code: code)
    }
}

class PaymentBonusArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_PAYMENT_BONUS.rawValue
        ))
    }
}

class PaymentBarterArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_PAYMENT_BARTER.rawValue
    init() {
        super.init(article: ArticleCode.get(PaymentBarterArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        PaymentBarterArtSpec(_code: code)
    }
}

class PaymentBarterArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_PAYMENT_BARTER.rawValue
        ))
    }
}

class AllowceHofficeArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_ALLOWCE_HOFFICE.rawValue
    init() {
        super.init(article: ArticleCode.get(AllowceHofficeArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        AllowceHofficeArtSpec(_code: code)
    }
}

class AllowceHofficeArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_ALLOWCE_HOFFICE.rawValue
        ))
    }
}

class HealthInsbaseArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue
    init() {
        super.init(article: ArticleCode.get(HealthInsbaseArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        HealthInsbaseArtSpec(_code: code)
    }
}

class HealthInsbaseArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_HEALTH_INSBASE.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue
        ))
    }
}

class SocialInsbaseArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue
    init() {
        super.init(article: ArticleCode.get(SocialInsbaseArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        SocialInsbaseArtSpec(_code: code)
    }
}

class SocialInsbaseArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_SOCIAL_INSBASE.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue
        ))
    }
}

class HealthInspaymArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_HEALTH_INSPAYM.rawValue
    init() {
        super.init(article: ArticleCode.get(HealthInspaymArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        HealthInspaymArtSpec(_code: code)
    }
}

class HealthInspaymArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_HEALTH_INSPAYM.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_HEALTH_INSPAYM.rawValue
        ))
    }
}

class SocialInspaymArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_SOCIAL_INSPAYM.rawValue
    init() {
        super.init(article: ArticleCode.get(SocialInspaymArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        SocialInspaymArtSpec(_code: code)
    }
}

class SocialInspaymArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_SOCIAL_INSPAYM.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_SOCIAL_INSPAYM.rawValue
        ))
    }
}

class TaxingAdvbaseArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue
    init() {
        super.init(article: ArticleCode.get(TaxingAdvbaseArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        TaxingAdvbaseArtSpec(_code: code)
    }
}

class TaxingAdvbaseArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TAXING_ADVBASE.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue
        ))
    }
}

class TaxingAdvpaymArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_TAXING_ADVPAYM.rawValue
    init() {
        super.init(article: ArticleCode.get(TaxingAdvpaymArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        TaxingAdvpaymArtSpec(_code: code)
    }
}

class TaxingAdvpaymArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TAXING_ADVPAYM.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_TAXING_ADVPAYM.rawValue
        ))
    }
}

class IncomeGrossArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue
    init() {
        super.init(article: ArticleCode.get(IncomeGrossArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        IncomeGrossArtSpec(_code: code)
    }
}

class IncomeGrossArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_INCOME_GROSS.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue
        ))
    }
}

class IncomeNettoArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_INCOME_NETTO.rawValue
    init() {
        super.init(article: ArticleCode.get(IncomeNettoArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        IncomeNettoArtSpec(_code: code)
    }
}

class IncomeNettoArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_INCOME_NETTO.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>(
                arrayLiteral: ExampleArticleConst.ARTICLE_INCOME_NETTO.rawValue
        ))
    }
}

