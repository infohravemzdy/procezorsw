//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public protocol ICodeValue {
    associatedtype T
    var value: T { get }
}
