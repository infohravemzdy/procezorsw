//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public protocol ISpecDefine {
    associatedtype T : ISpecCode
    var code: T { get }
}
