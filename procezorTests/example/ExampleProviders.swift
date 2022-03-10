//
// Created by Ladislav Lisy on 05.11.2021.
//

import Foundation

@testable import legalios
@testable import procezor

// TimeshtWorking		TIMESHT_WORKING
class TimeshtWorkingConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TIMESHT_WORKING.rawValue
    init() {
        super.init(concept: ConceptCode.get(TimeshtWorkingConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return TimeshtWorkingConSpec(_code: self.code)
    }
}

class TimeshtWorkingConSpec : ExampleConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: TimeshtWorkingConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = TimeshtWorkingResult(target: target, spec: spec)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

// AmountBasis		AMOUNT_BASIS
class AmountBasisConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_BASIS.rawValue
    init() {
        super.init(concept: ConceptCode.get(AmountBasisConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return AmountBasisConSpec(_code: self.code)
    }
}

class AmountBasisConSpec : ExampleConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: AmountBasisConSpec.constToPathArray(path: [
            ExampleArticleConst.ARTICLE_TIMESHT_WORKING.rawValue,
        ]), result: AmountBasisConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = AmountBasisResult(target: target, spec: spec)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

// AmountFixed		AMOUNT_FIXED
class AmountFixedConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue
    init() {
        super.init(concept: ConceptCode.get(AmountFixedConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return AmountFixedConSpec(_code: self.code)
    }
}

class AmountFixedConSpec : ExampleConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: AmountFixedConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = AmountFixedResult(target: target, spec: spec)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

// HealthInsbase		HEALTH_INSBASE
class HealthInsbaseConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_HEALTH_INSBASE.rawValue
    init() {
        super.init(concept: ConceptCode.get(HealthInsbaseConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return HealthInsbaseConSpec(_code: self.code)
    }
}

class HealthInsbaseConSpec : ExampleConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: HealthInsbaseConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = HealthInsbaseResult(target: target, spec: spec)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

// SocialInsbase		SOCIAL_INSBASE
class SocialInsbaseConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_SOCIAL_INSBASE.rawValue
    init() {
        super.init(concept: ConceptCode.get(SocialInsbaseConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return SocialInsbaseConSpec(_code: self.code)
    }
}

class SocialInsbaseConSpec : ExampleConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: SocialInsbaseConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = SocialInsbaseResult(target: target, spec: spec)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

// HealthInspaym		HEALTH_INSPAYM
class HealthInspaymConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_HEALTH_INSPAYM.rawValue
    init() {
        super.init(concept: ConceptCode.get(HealthInspaymConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return HealthInspaymConSpec(_code: self.code)
    }
}

class HealthInspaymConSpec : ExampleConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: HealthInspaymConSpec.constToPathArray(path: [
            ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue,
        ]), result: HealthInspaymConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = HealthInspaymResult(target: target, spec: spec)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

// SocialInspaym		SOCIAL_INSPAYM
class SocialInspaymConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_SOCIAL_INSPAYM.rawValue
    init() {
        super.init(concept: ConceptCode.get(SocialInspaymConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return SocialInspaymConSpec(_code: self.code)
    }
}

class SocialInspaymConSpec : ExampleConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: SocialInspaymConSpec.constToPathArray(path: [
            ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue,
        ]), result: SocialInspaymConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = SocialInspaymResult(target: target, spec: spec)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

// TaxingAdvbase		TAXING_ADVBASE
class TaxingAdvbaseConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TAXING_ADVBASE.rawValue
    init() {
        super.init(concept: ConceptCode.get(TaxingAdvbaseConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return TaxingAdvbaseConSpec(_code: self.code)
    }
}

class TaxingAdvbaseConSpec : ExampleConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: TaxingAdvbaseConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = TaxingAdvbaseResult(target: target, spec: spec)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

// TaxingAdvpaym		TAXING_ADVPAYM
class TaxingAdvpaymConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TAXING_ADVPAYM.rawValue
    init() {
        super.init(concept: ConceptCode.get(TaxingAdvpaymConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return TaxingAdvpaymConSpec(_code: self.code)
    }
}

class TaxingAdvpaymConSpec : ExampleConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: TaxingAdvpaymConSpec.constToPathArray(path: [
            ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue,
        ]), result: TaxingAdvpaymConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = TaxingAdvpaymResult(target: target, spec: spec)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

// IncomeGross		INCOME_GROSS
class IncomeGrossConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_INCOME_GROSS.rawValue
    init() {
        super.init(concept: ConceptCode.get(IncomeGrossConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return IncomeGrossConSpec(_code: self.code)
    }
}

class IncomeGrossConSpec : ExampleConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: IncomeGrossConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = IncomeGrossResult(target: target, spec: spec)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

// IncomeNetto		INCOME_NETTO
class IncomeNettoConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_INCOME_NETTO.rawValue
    init() {
        super.init(concept: ConceptCode.get(IncomeNettoConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return IncomeNettoConSpec(_code: self.code)
    }
}

class IncomeNettoConSpec : ExampleConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: IncomeNettoConSpec.constToPathArray(path: [
            ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue,
            ExampleArticleConst.ARTICLE_HEALTH_INSPAYM.rawValue,
            ExampleArticleConst.ARTICLE_SOCIAL_INSPAYM.rawValue,
            ExampleArticleConst.ARTICLE_TAXING_ADVPAYM.rawValue,
        ]), result: IncomeNettoConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, spec: ArticleSpec?, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = IncomeNettoResult(target: target, spec: spec)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

