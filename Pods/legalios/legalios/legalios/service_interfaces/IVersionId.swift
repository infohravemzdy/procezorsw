//
// Created by Ladislav Lisy on 13.06.2021.
//

import Foundation

protocol IVersionId {
    associatedtype T

    var value:T { get }
}
