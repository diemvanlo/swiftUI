import UIKit

let edges: [[Int]] = [[1,0], [1,2], [2,3], [2,4], [3,4]]

let base = Array(repeating: 0, count: 5)
var matrix: [[Int]] = Array(repeating: base, count: 5)

edges.forEach { edge in
    let u = edge[0]
    let v = edge[1]
    matrix[u][v] = 1
    matrix[v][u] = 1
}

matrix.forEach { row in
    print("mine \(row)")
}
