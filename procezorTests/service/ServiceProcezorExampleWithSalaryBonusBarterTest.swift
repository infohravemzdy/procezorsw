//
// Created by Ladislav Lisy on 22.09.2021.
//

import Foundation
import Quick
import Nimble

@testable import legalios
@testable import procezor

class ServiceProcezorExampleWithSalaryBonusBarterTest: QuickSpec {
    static func getTargetsFromDb(period: IPeriod) -> Array<ITermTarget> {
        let CONTRACT_CODE: Int16 = 0
        let POSITION_CODE: Int16 = 0

        let montCode = MonthCode.get(period.code)
        let contract = ContractCode.get(CONTRACT_CODE)
        let position = PositionCode.get(POSITION_CODE)
        let variant1 = VariantCode.get(1)

        let targets  = Array<ITermTarget>(arrayLiteral:
            ExampleTermTarget(_month: montCode, _contract: contract, _position: position, _variant: variant1,
                _article: ArticleCode.get(ExampleArticleConst.ARTICLE_TIMESHT_WORKING.rawValue),
                _concept: ConceptCode.get(ExampleConceptConst.CONCEPT_TIMESHT_WORKING.rawValue)),
            ExampleTermTarget(_month: montCode, _contract: contract, _position: position, _variant: variant1,
                _article: ArticleCode.get(ExampleArticleConst.ARTICLE_PAYMENT_SALARY.rawValue),
                _concept: ConceptCode.get(ExampleConceptConst.CONCEPT_AMOUNT_BASIS.rawValue)),
            ExampleTermTarget(_month: montCode, _contract: contract, _position: position, _variant: variant1,
                _article: ArticleCode.get(ExampleArticleConst.ARTICLE_PAYMENT_BONUS.rawValue),
                _concept: ConceptCode.get(ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue)),
            ExampleTermTarget(_month: montCode, _contract: contract, _position: position, _variant: variant1,
                _article: ArticleCode.get(ExampleArticleConst.ARTICLE_PAYMENT_BARTER.rawValue),
                _concept: ConceptCode.get(ExampleConceptConst.CONCEPT_AMOUNT_FIXED.rawValue))
        )
        return targets
    }
    override func spec() {
        describe("Example example - service Procezor", {
            let testService = ServiceExample()

            let testVersion = testService.version
            it("service version should return 100, got \(testVersion.value)") {
                expect(testVersion.value).to(equal(100))
            }
            let testPeriod = Period.getWithYearMonth(year: 2021, month: 1)
            it("period code should return 202101, got \(testPeriod.code)") {
                expect(testPeriod.code).to(equal(202101))
            }
            let testRuleset: IBundleProps = BundleProps.empty()

            let factoryArticleCode = ArticleCode.get(ExampleArticleConst.ARTICLE_TIMESHT_WORKING.rawValue)

            let factoryArticle = testService.getArticleSpec(code: factoryArticleCode, period: testPeriod, version: testVersion)
            it("article should be valid, got \(String(describing: getArticleSymbol(item: factoryArticle?.code.value ?? 0)))") {
                expect(factoryArticle).toNot(beNil())
                expect(factoryArticle?.code.value).toNot(equal(0))
            }

            let factoryConceptCode = ConceptCode.get(ExampleConceptConst.CONCEPT_TIMESHT_WORKING.rawValue)

            let factoryConcept = testService.getConceptSpec(code: factoryConceptCode, period: testPeriod, version: testVersion)
            it("concept should be valid, got \(String(describing: getConceptSymbol(item: factoryConcept?.code.value ?? 0)))") {
                expect(factoryConcept).toNot(beNil())
                expect(factoryConcept?.code.value).toNot(equal(0))
            }

            let initService = testService.initWithPeriod(period: testPeriod)
            it("init service should return true, got \(initService)") {
                expect(initService).to(beTrue())
            }

            let restTargets = ServiceProcezorExampleWithSalaryBonusBarterTest.getTargetsFromDb(period: testPeriod)
            let restService = testService.getResults(period: testPeriod, ruleset: testRuleset, targets: restTargets)
            it("getting results should return not empty array, got \(restService.count)") {
                expect(restService.count).toNot(equal(0))
            }

            restService.enumerated().forEach({ index, result in
                switch result {
                case .success(let resultValue):
                    let articleSymbol: String = resultValue.articleDescr()
                    let conceptSymbol: String = resultValue.conceptDescr()
                    print("Index: \(index), ART: \(articleSymbol), CON: \(conceptSymbol)".utf8)
                case .failure(let errorValue):
                    let resultError = errorValue as TermResultError
                    let articleSymbol: String = resultError.articleDescr()
                    let conceptSymbol: String = resultError.conceptDescr()
                    print("Index: \(index), ART: \(articleSymbol), CON: \(conceptSymbol), Error: \(resultError.description)".utf8)
                }
            })

            let testArticles: [Int32] = [80001, 80003, 80004, 80002, 80006, 80007, 80010, 80012, 80008, 80009, 80011, 80013]
            let restArticles: [Int32] = restService.filter { x in isSuccess(x) }.map { x in successArticleValue(x) }

            it("getting results should return same length array, got \(testArticles.count)") {
                expect(restArticles.count).to(equal(testArticles.count))
            }
            it("getting results should return same order array, got \(testArticles)") {
                expect(restArticles).to(equal(testArticles))
            }
        })
    }
}
