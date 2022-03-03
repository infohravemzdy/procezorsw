//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public protocol IArticleSpec : ISpecDefine {
    var sums: Array<ArticleCode> { get }
    func term() -> ArticleTerm
    func defs() -> ArticleDefine
}
