//
// Created by Ladislav Lisy on 05.11.2021.
//

import Foundation
import  legalios

class ExampleTermTarget : TermTarget {
    override init (_month: MonthCode,
                   _contract: ContractCode,
                   _position: PositionCode,
                   _variant: VariantCode,
                   _article: ArticleCode,
                   _concept: ConceptCode,
                   _basis: Int32,
                   _descr: String) {
        super.init(_month: _month,
                _contract: _contract,
                _position: _position,
                _variant: _variant,
                _article: _article,
                _concept: _concept,
                _basis: _basis,
                _descr: _descr)
    }
    convenience init (_month: MonthCode,
                      _contract: ContractCode,
                      _position: PositionCode,
                      _variant: VariantCode,
                      _article: ArticleCode,
                      _concept: ConceptCode) {
        self.init(_month: _month,
                _contract: _contract,
                _position: _position,
                _variant: _variant,
                _article: _article,
                _concept: _concept,
                _basis: 0,
                _descr: "")
    }
    public override func articleDescr() -> String {
        getArticleSymbol(item: article.value)
    }

    public override func conceptDescr() -> String {
        getConceptSymbol(item: concept.value)
    }
}

class ExampleTermResult : TermResult {
    override init(_target: ITermTarget?, _value: Int32, _basis: Int32, _descr: String) {
        super.init(_target: _target, _value: _value, _basis: _basis, _descr: _descr)
    }
    public override func articleDescr() -> String {
        getArticleSymbol(item: article.value)
    }

    public override func conceptDescr() -> String {
        getConceptSymbol(item: concept.value)
    }
}

class TimeshtWorkingConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TIMESHT_WORKING.rawValue
    init() {
        super.init(concept: ConceptCode.get(TimeshtWorkingConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return TimeshtWorkingConSpec(_code: self.code)
    }
}

class TimeshtWorkingConSpec : ConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: TimeshtWorkingConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = TimeshtWorkingResult(target: target, value: 0, basis: 0, descr: ExampleResultConst.DESCRIPTION_EMPTY)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

class AmountBasisConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_BASIS.rawValue
    init() {
        super.init(concept: ConceptCode.get(AmountBasisConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return AmountBasisConSpec(_code: self.code)
    }
}

class AmountBasisConSpec : ConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: AmountBasisConSpec.constToPathArray(path: [
            ExampleArticleConst.ARTICLE_TIMESHT_WORKING.rawValue,
        ]), result: AmountBasisConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = AmountBasisResult(target: target, value: 0, basis: 0, descr: ExampleResultConst.DESCRIPTION_EMPTY)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

class AmountFixedConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue
    init() {
        super.init(concept: ConceptCode.get(AmountFixedConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return AmountFixedConSpec(_code: self.code)
    }
}

class AmountFixedConSpec : ConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: AmountFixedConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = AmountFixedResult(target: target, value: 0, basis: 0, descr: ExampleResultConst.DESCRIPTION_EMPTY)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

class HealthInsbaseConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_HEALTH_INSBASE.rawValue
    init() {
        super.init(concept: ConceptCode.get(HealthInsbaseConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return HealthInsbaseConSpec(_code: self.code)
    }
}

class HealthInsbaseConSpec : ConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: HealthInsbaseConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = HealthInsbaseResult(target: target, value: 0, basis: 0, descr: ExampleResultConst.DESCRIPTION_EMPTY)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

class SocialInsbaseConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_SOCIAL_INSBASE.rawValue
    init() {
        super.init(concept: ConceptCode.get(SocialInsbaseConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return SocialInsbaseConSpec(_code: self.code)
    }
}

class SocialInsbaseConSpec : ConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: SocialInsbaseConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = SocialInsbaseResult(target: target, value: 0, basis: 0, descr: ExampleResultConst.DESCRIPTION_EMPTY)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

class HealthInspaymConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_HEALTH_INSPAYM.rawValue
    init() {
        super.init(concept: ConceptCode.get(HealthInspaymConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return HealthInspaymConSpec(_code: self.code)
    }
}

class HealthInspaymConSpec : ConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: HealthInspaymConSpec.constToPathArray(path: [
            ExampleArticleConst.ARTICLE_HEALTH_INSBASE.rawValue,
        ]), result: HealthInspaymConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = HealthInspaymResult(target: target, value: 0, basis: 0, descr: ExampleResultConst.DESCRIPTION_EMPTY)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

class SocialInspaymConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_SOCIAL_INSPAYM.rawValue
    init() {
        super.init(concept: ConceptCode.get(SocialInspaymConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return SocialInspaymConSpec(_code: self.code)
    }
}

class SocialInspaymConSpec : ConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: SocialInspaymConSpec.constToPathArray(path: [
            ExampleArticleConst.ARTICLE_SOCIAL_INSBASE.rawValue,
        ]), result: SocialInspaymConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = SocialInspaymResult(target: target, value: 0, basis: 0, descr: ExampleResultConst.DESCRIPTION_EMPTY)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

class TaxingAdvbaseConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TAXING_ADVBASE.rawValue
    init() {
        super.init(concept: ConceptCode.get(TaxingAdvbaseConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return TaxingAdvbaseConSpec(_code: self.code)
    }
}

class TaxingAdvbaseConSpec : ConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: TaxingAdvbaseConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = TaxingAdvbaseResult(target: target, value: 0, basis: 0, descr: ExampleResultConst.DESCRIPTION_EMPTY)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

class TaxingAdvpaymConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_TAXING_ADVPAYM.rawValue
    init() {
        super.init(concept: ConceptCode.get(TaxingAdvpaymConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return TaxingAdvpaymConSpec(_code: self.code)
    }
}

class TaxingAdvpaymConSpec : ConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: TaxingAdvpaymConSpec.constToPathArray(path: [
            ExampleArticleConst.ARTICLE_TAXING_ADVBASE.rawValue,
        ]), result: TaxingAdvpaymConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = TaxingAdvpaymResult(target: target, value: 0, basis: 0, descr: ExampleResultConst.DESCRIPTION_EMPTY)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

class IncomeGrossConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_INCOME_GROSS.rawValue
    init() {
        super.init(concept: ConceptCode.get(IncomeGrossConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return IncomeGrossConSpec(_code: self.code)
    }
}

class IncomeGrossConSpec : ConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: Array<ArticleCode>(), result: IncomeGrossConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = IncomeGrossResult(target: target, value: 0, basis: 0, descr: ExampleResultConst.DESCRIPTION_EMPTY)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

class IncomeNettoConProv : ConceptSpecProvider {
    static let CONCEPT_CODE = ExampleConceptConst.CONCEPT_INCOME_NETTO.rawValue
    init() {
        super.init(concept: ConceptCode.get(IncomeNettoConProv.CONCEPT_CODE))
    }

    override func getSpec(period: IPeriod, version: VersionCode) -> ConceptSpec {
        return IncomeNettoConSpec(_code: self.code)
    }
}

class IncomeNettoConSpec : ConceptSpec {
    init(_code: ConceptCode) {
        super.init(concept: _code, path: IncomeNettoConSpec.constToPathArray(path: [
            ExampleArticleConst.ARTICLE_INCOME_GROSS.rawValue,
            ExampleArticleConst.ARTICLE_HEALTH_INSPAYM.rawValue,
            ExampleArticleConst.ARTICLE_SOCIAL_INSPAYM.rawValue,
            ExampleArticleConst.ARTICLE_TAXING_ADVPAYM.rawValue,
        ]), result: IncomeNettoConSpec.conceptEval)
    }
    static func conceptEval(target: ITermTarget, period: IPeriod, ruleset: IBundleProps, results: BuilderResultList) -> BuilderResultList {
        let resultsValues: ITermResult = IncomeNettoResult(target: target, value: 0, basis: 0, descr: ExampleResultConst.DESCRIPTION_EMPTY)

        return Array<BuilderResult>(arrayLiteral: Result.success(resultsValues))
    }
}

