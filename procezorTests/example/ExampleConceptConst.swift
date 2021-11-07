//
// Created by Ladislav Lisy on 22.09.2021.
//

import Foundation

enum ExampleConceptConst : Int32 {
    case CONCEPT_TIMESHT_WORKING = 80001
    case CONCEPT_AMOUNT_BASIS    = 80002
    case CONCEPT_AMOUNT_FIXED    = 80003
    case CONCEPT_HEALTH_INSBASE  = 80006
    case CONCEPT_SOCIAL_INSBASE  = 80007
    case CONCEPT_HEALTH_INSPAYM  = 80008
    case CONCEPT_SOCIAL_INSPAYM  = 80009
    case CONCEPT_TAXING_ADVBASE  = 80010
    case CONCEPT_TAXING_ADVPAYM  = 80011
    case CONCEPT_INCOME_GROSS    = 80012
    case CONCEPT_INCOME_NETTO    = 80013
}

func getConceptSymbol(item: Int32) -> String {
    let concept =  ExampleConceptConst(rawValue: item)
    if (concept == nil) {
        return String("ConceptCode for \(item)")
    }
    return String("\(concept!)")
}
