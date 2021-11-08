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
        return TimeshtWorkingArtSpec(_code: self.code)
    }
}

class TimeshtWorkingArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TIMESHT_WORKING.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>())
    }
}

class PaymentSalaryArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_PAYMENT_SALARY.rawValue
    init() {
        super.init(article: ArticleCode.get(PaymentSalaryArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return PaymentSalaryArtSpec(_code: self.code)
    }
}

class PaymentSalaryArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_BASIS.rawValue
    init (_code: ArticleCode) {
        let _sums = [
            ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue,
            ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue,
            ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue,
            ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue,
        ]
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: _sums)
    }
}

class PaymentBonusArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_PAYMENT_BONUS.rawValue
    init() {
        super.init(article: ArticleCode.get(PaymentBonusArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return PaymentBonusArtSpec(_code: self.code)
    }
}

class PaymentBonusArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue
    init (_code: ArticleCode) {
        let _sums = [
            ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue,
            ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue,
            ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue,
            ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue,
        ]
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: _sums)
    }
}

class PaymentBarterArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_PAYMENT_BARTER.rawValue
    init() {
        super.init(article: ArticleCode.get(PaymentBarterArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return PaymentBarterArtSpec(_code: self.code)
    }
}

class PaymentBarterArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue
    init (_code: ArticleCode) {
        let _sums = [
            ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue,
            ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue,
            ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue,
        ]
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: _sums)
    }
}

class AllowceHofficeArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_ALLOWCE_HOFFICE.rawValue
    init() {
        super.init(article: ArticleCode.get(AllowceHofficeArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return AllowceHofficeArtSpec(_code: self.code)
    }
}

class AllowceHofficeArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue
    init (_code: ArticleCode) {
        let _sums = [
            ExampleArticleConst.ARTICLE_INCOME_NETTO.rawValue,
        ]
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: _sums)
    }
}

class HealthInsbaseArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue
    init() {
        super.init(article: ArticleCode.get(HealthInsbaseArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return HealthInsbaseArtSpec(_code: self.code)
    }
}

class HealthInsbaseArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_HEALTH_INSBASE.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>())
    }
}

class SocialInsbaseArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue
    init() {
        super.init(article: ArticleCode.get(SocialInsbaseArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return SocialInsbaseArtSpec(_code: self.code)
    }
}

class SocialInsbaseArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_SOCIAL_INSBASE.rawValue

    init(_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>())
    }
}

class HealthInspaymArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_HEALTH_INSPAYM.rawValue
    init() {
        super.init(article: ArticleCode.get(HealthInspaymArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return HealthInspaymArtSpec(_code: self.code)
    }
}

class HealthInspaymArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_HEALTH_INSPAYM.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>())
    }
}

class SocialInspaymArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_SOCIAL_INSPAYM.rawValue
    init() {
        super.init(article: ArticleCode.get(SocialInspaymArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return SocialInspaymArtSpec(_code: self.code)
    }
}

class SocialInspaymArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_SOCIAL_INSPAYM.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>())
    }
}

class TaxingAdvbaseArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue
    init() {
        super.init(article: ArticleCode.get(TaxingAdvbaseArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return TaxingAdvbaseArtSpec(_code: self.code)
    }
}

class TaxingAdvbaseArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TAXING_ADVBASE.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>())
    }
}

class TaxingAdvpaymArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_TAXING_ADVPAYM.rawValue
    init() {
        super.init(article: ArticleCode.get(TaxingAdvpaymArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return TaxingAdvpaymArtSpec(_code: self.code)
    }
}

class TaxingAdvpaymArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TAXING_ADVPAYM.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>())
    }
}

class IncomeGrossArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue
    init() {
        super.init(article: ArticleCode.get(IncomeGrossArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return IncomeGrossArtSpec(_code: self.code)
    }
}

class IncomeGrossArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_INCOME_GROSS.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>())
    }
}

class IncomeNettoArtProv : ArticleSpecProvider {
    static let ARTICLE_CODE = ExampleArticleConst.ARTICLE_INCOME_NETTO.rawValue
    init() {
        super.init(article: ArticleCode.get(IncomeNettoArtProv.ARTICLE_CODE))
    }
    override func getSpec(period: IPeriod, version: VersionCode) -> ArticleSpec {
        return IncomeNettoArtSpec(_code: self.code)
    }
}

class IncomeNettoArtSpec : ArticleSpec {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_INCOME_NETTO.rawValue
    init (_code: ArticleCode) {
        super.init(code: _code.value, role: PaymentSalaryArtSpec.CONCEPT_CODE, sums: Array<Int32>())
    }
}

