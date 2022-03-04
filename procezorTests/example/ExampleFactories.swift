//
// Created by Ladislav Lisy on 05.11.2021.
//

import Foundation

@testable import legalios
@testable import procezor

class ExampleArticleFactory : ArticleSpecFactory {
    private static let ARTICLE_DEFAULT_SEQUENS: Int16 = 0
    private let providersConfig = Array<ProviderRecord>(arrayLiteral:
            ProviderRecord(article: ExampleArticleConst.ARTICLE_TIMESHT_WORKING.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_TIMESHT_WORKING.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_PAYMENT_SALARY.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_AMOUNT_BASIS.rawValue,
                    sums: Array<Int32>(arrayLiteral:
                        ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue,
                        ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue,
                        ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue,
                        ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue
                    )),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_PAYMENT_BONUS.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue,
                    sums: Array<Int32>(arrayLiteral:
                        ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue,
                        ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue,
                        ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue,
                        ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue
                    )),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_PAYMENT_BARTER.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue,
                    sums: Array<Int32>(arrayLiteral:
                        ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue,
                        ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue,
                        ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue
                    )),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_ALLOWCE_HOFFICE.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue,
                    sums: Array<Int32>(arrayLiteral:
                        ExampleArticleConst.ARTICLE_INCOME_NETTO.rawValue
                    )),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_HEALTH_INSBASE.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_SOCIAL_INSBASE.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_HEALTH_INSPAYM.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_HEALTH_INSPAYM.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_SOCIAL_INSPAYM.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_SOCIAL_INSPAYM.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_TAXING_ADVBASE.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_TAXING_ADVPAYM.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_TAXING_ADVPAYM.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_INCOME_GROSS.rawValue,
                    sums: Array<Int32>()),
            ProviderRecord(article: ExampleArticleConst.ARTICLE_INCOME_NETTO.rawValue, sequens: ARTICLE_DEFAULT_SEQUENS, concept: ExampleConceptConst.CONCEPT_INCOME_NETTO.rawValue,
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
