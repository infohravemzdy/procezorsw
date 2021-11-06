//
// Created by Ladislav Lisy on 21.09.2021.
//

import Foundation

struct ArticleEdge : Hashable {
    let start: ArticleCode
    let stops: ArticleCode

    var hashValue: Int {
        return start.hashValue ^ stops.hashValue  &* 16777619
    }
}

class Queue<T> {
    private var elements: Array<T> = []

    init(items: Array<T>) {
        elements = items.map { $0 }
    }
    func isEmpty() -> Bool {return elements.count == 0}
    func count() -> Int {return elements.count }
    func enqueue(item: T) {
        elements.append(item)
    }
    func dequeue() -> T? {
        return !isEmpty() ? elements.remove(at: 0) : nil
    }
    func peek() -> T? {
        return !isEmpty() ? elements[0] : nil
    }
    func push(items: Array<T>) {
        items.forEach { it in enqueue(item: it) }
    }
}


class DependencyGraph {
    private func compareDefines(topoOrders: Array<ArticleCode>) -> (ArticleDefine, ArticleDefine) -> Bool {
        let lessThan: (ArticleDefine, ArticleDefine) -> Bool = { (x, y) in
            let xIndex = topoOrders.firstIndex(of: x.code)

            let yIndex = topoOrders.firstIndex(of: y.code)

            var compareIndex = 0

            if (xIndex == nil && yIndex == nil)
            {
                compareIndex = 0
            }
            else if (xIndex == nil && yIndex != nil)
            {
                compareIndex = -1
            }
            else if (xIndex != nil && yIndex == nil)
            {
                compareIndex = 1
            }
            else
            {
                let xIndexValue = xIndex!
                let yIndexValue = yIndex!
                if (xIndexValue > yIndexValue)
                {
                    compareIndex = 1
                }
                else if (xIndexValue < yIndexValue)
                {
                    compareIndex = -1
                }
                else
                {
                    compareIndex = 0
                }
            }
            return compareIndex < 0
        }
        return lessThan
    }
    func initGraphModel(articlesModel: Array<ArticleSpec>, conceptsModel: Array<ConceptSpec>)
                    -> (Array<ArticleCode>, Dictionary<ArticleCode, Array<ArticleDefine>>) {
        let vertModel: Array<ArticleCode> = createVertModel(articlesModel: articlesModel)
        let edgeModel: Array<ArticleEdge> = createEdgeModel(articlesModel: articlesModel, conceptsModel: conceptsModel)

        let order = createTopoModel(vertModel: vertModel, edgeModel: edgeModel)
        let paths = createPathModel(articlesModel: articlesModel, vertModel: vertModel, edgeModel: edgeModel, vertOrder: order)

        return (order, paths)
    }
    private func createVertModel(articlesModel: Array<ArticleSpec>) -> Array<ArticleCode> {
        return articlesModel.map { a in return a.code }.map { $0 }.sorted()
    }
    private func createEdgeModel(articlesModel: Array<ArticleSpec>, conceptsModel: Array<ConceptSpec>) -> Array<ArticleEdge> {
        func edgeSorter(x:ArticleEdge, y:ArticleEdge) -> Bool {
            if (x.start == y.start) {
                return x.stops < y.stops
            }
            return x.start < y.start
        }
        var initEdge: Array<ArticleEdge> = []

        return articlesModel.reduce(initEdge) { agr, x in
            return mergeEdges(conceptsModel: conceptsModel, agr: agr, article: x) }
                .sorted(by: edgeSorter)
    }
    private func createPathModel(articlesModel: Array<ArticleSpec>, vertModel: Array<ArticleCode>, edgeModel: Array<ArticleEdge>, vertOrder: Array<ArticleCode>) -> Dictionary<ArticleCode, Array<ArticleDefine>> {
        return Dictionary<ArticleCode, Array<ArticleDefine>>(uniqueKeysWithValues: vertModel.map { x in
            return (x, mergePaths(articlesModel: articlesModel, edgeModel: edgeModel, vertOrder: vertOrder, article: x)) })
    }
    private func mergeEdges(conceptsModel: Array<ConceptSpec>, agr: Array<ArticleEdge>,  article: ArticleSpec) -> Array<ArticleEdge>
    {
        var result = Set<ArticleEdge>(agr).map { $0 }
        var concept = conceptsModel.first { c in return c.code == article.role }

        if (concept != nil) {
            result = Set<ArticleEdge>(article.sums.map { s in return ArticleEdge(start: article.code, stops: s) } + result).map { $0 }

            result = Set<ArticleEdge>(concept!.path.map { p in return ArticleEdge(start: p, stops: article.code) } + result).map { $0 }
        }
        return result
    }
    private func mergePaths(articlesModel: Array<ArticleSpec>, edgeModel: Array<ArticleEdge>, vertOrder: Array<ArticleCode>, article: ArticleCode) -> Array<ArticleDefine> {
        let articleInit: Array<ArticleDefine> = edgeModel.filter { e in return (e.stops == article) }
                .map { e in return getArticleDefs(article: e.start, articlesModel: articlesModel) }.map { $0 }

        let articlePath = articleInit.reduce(articleInit) { agr, x in
            return mergeVert(articlesModel: articlesModel, edgeModel: edgeModel, resultVert: agr, defs: x) }

        return Set<ArticleDefine>(articlePath).sorted(by: compareDefines(topoOrders: vertOrder.map { $0 }))
    }
    private func mergeVert(articlesModel: Array<ArticleSpec>, edgeModel: Array<ArticleEdge>, resultVert: Array<ArticleDefine>, defs: ArticleDefine) -> Array<ArticleDefine> {
        let resultInit: Array<ArticleDefine> = edgeModel.filter { e in return (e.stops == defs.code) }
                .map { e in return  getArticleDefs(article: e.start, articlesModel: articlesModel) }.map { $0 }

        let resultList = resultInit.reduce(resultInit) { agr, x in
            return mergeVert(articlesModel: articlesModel, edgeModel: edgeModel, resultVert: agr, defs: x) }

        return (resultVert + resultList + [defs]).map { $0 }
    }
    private func getArticleDefs(article: ArticleCode, articlesModel: Array<ArticleSpec>) -> ArticleDefine {
        let articleSpec = articlesModel.first { m in return (m.code == article) }
        if (articleSpec == nil) {
            return ArticleDefine()
        }
        return articleSpec!.defs()
    }
    private func createTopoModel(vertModel: Array<ArticleCode>, edgeModel: Array<ArticleEdge>) -> Array<ArticleCode>
    {
        var articlesOrder = Array<ArticleCode>()

        var degrees = Dictionary<ArticleCode, Int>(uniqueKeysWithValues: vertModel.map { x in
            return (x, edgeModel.reduce(0) { agr, e in return (e.stops == x) ? agr+1 : agr } ) } )

        let queues = Queue<ArticleCode>(items: degrees.filter { x in
            return (x.value == 0) }.map { x in x.key }.sorted())

        var index = 0
        while (queues.count() != 0)
        {
            index += 1
            let article = queues.dequeue()
            if (article != nil) {
                articlesOrder = articlesOrder + [article!]
            }
            let paths = edgeModel.filter { x in
                return (x.start == article) }.map { x in x.stops }.map { $0 }
            paths.forEach { p in
                let pathCount: Int = degrees[p] ?? 0
                degrees.updateValue(max(0, pathCount - 1), forKey: p)
                if (degrees[p] == 0)
                {
                    queues.enqueue(item: p)
                }
            }
        }
        if (index != vertModel.count)
        {
            return [ArticleCode]()
        }
        return articlesOrder
    }
}
