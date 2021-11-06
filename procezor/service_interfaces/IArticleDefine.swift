//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public protocol IArticleDefine : Hashable {
    var code : ArticleCode { get }
    var role : ConceptCode { get }

    var hashValue: Int { get }
}