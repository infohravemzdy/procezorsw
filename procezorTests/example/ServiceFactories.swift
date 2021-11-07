//
// Created by Ladislav Lisy on 05.11.2021.
//

import Foundation

class ExampleArticleFactory : ArticleSpecFactory {
    private let providersConfig = Array<ProviderRecord>(arrayLiteral:
    ProviderRecord(article: ExampleArticleConst.ARTICLE_TIMESHT_WORKING.rawValue, concept: ExampleConceptConst.CONCEPT_TIMESHT_WORKING.rawValue,
            sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_PAYMENT_SALARY.rawValue, concept: ExampleConceptConst.CONCEPT_AMOUNT_BASIS.rawValue,
                    sums: Array<Int32>(arrayLiteral:
                    ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue,
                            ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue,
                            ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue,
                            ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue
                    )),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_PAYMENT_BONUS.rawValue, concept: ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue,
                    sums: Array<Int32>(arrayLiteral:
                    ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue,
                            ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue,
                            ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue,
                            ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue
                    )),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_PAYMENT_BARTER.rawValue, concept: ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue,
                    sums: Array<Int32>(arrayLiteral:
                    ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue,
                            ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue,
                            ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue
                    )),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_ALLOWCE_HOFFICE.rawValue, concept: ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue,
                    sums: Array<Int32>(arrayLiteral:
                    ExampleArticleConst.ARTICLE_INCOME_NETTO.rawValue
                    )),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue, concept: ExampleConceptConst.CONCEPT_HEALTH_INSBASE.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue, concept: ExampleConceptConst.CONCEPT_SOCIAL_INSBASE.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_HEALTH_INSPAYM.rawValue, concept: ExampleConceptConst.CONCEPT_HEALTH_INSPAYM.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_SOCIAL_INSPAYM.rawValue, concept: ExampleConceptConst.CONCEPT_SOCIAL_INSPAYM.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue, concept: ExampleConceptConst.CONCEPT_TAXING_ADVBASE.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_TAXING_ADVPAYM.rawValue, concept: ExampleConceptConst.CONCEPT_TAXING_ADVPAYM.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue, concept: ExampleConceptConst.CONCEPT_INCOME_GROSS.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_INCOME_NETTO.rawValue, concept: ExampleConceptConst.CONCEPT_INCOME_NETTO.rawValue,
                    sums: Array<Int32>())
    )
    init() {
        let provList: Array<ArticleSpecProvider> = ArticleSpecFactory.BuildProvidersFromRecords(records: providersConfig)
        super.init(provList: provList)
    }
}

class ExampleConceptFactory : ConceptSpecFactory {
    init() {
        let provList = Array<ConceptSpecProvider>(arrayLiteral:
        TimeshtWorkingConProv(),
                AmountBasisConProv(),
                AmountFixedConProv(),
                HealthInsbaseConProv(),
                SocialInsbaseConProv(),
                HealthInspaymConProv(),
                SocialInspaymConProv(),
                TaxingAdvbaseConProv(),
                TaxingAdvpaymConProv(),
                IncomeGrossConProv(),
                IncomeNettoConProv())
        super.init(provList: provList)
    }
}
