//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

public class ArticleDefine : IArticleDefine {
    public let code: ArticleCode
    public let role: ConceptCode

    public static func ==(lhs: ArticleDefine, rhs: ArticleDefine) -> Bool {
        lhs.code == rhs.code
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }

    init(code: ArticleCode, role: ConceptCode) {
        self.code = code
        self.role = role
    }

    convenience init() {
        self.init(code: ArticleCode.new(), role: ConceptCode.new())
    }

    convenience init(code: ArticleCode) {
        self.init(code: code, role: ConceptCode.new())
    }

    convenience init(code: Int32, role: Int32) {
        self.init(code: ArticleCode.get(code), role: ConceptCode.get(role))
    }

    convenience init(defs: ArticleDefine) {
        self.init(code: defs.code, role: defs.role)
    }
}
