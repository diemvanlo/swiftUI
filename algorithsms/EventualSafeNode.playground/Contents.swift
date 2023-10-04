import UIKit

func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
    let length = graph.count
    var vis = Array(repeating: false, count: length)
    var path = Array(repeating: false, count: length)
    
    for i in 0...(length - 1) {
        if vis[i] {
            continue
        }
        dfs(i, graph, &vis, &path)
    }
    
    return path.indices.filter { path[$0] == false }
}

func dfs(_ node: Int, _ graph: [[Int]], _ vis: inout [Bool], _ path: inout [Bool]) -> Bool {
    vis[node] = true
    path[node] = true
    
    for row in graph[node] {
        if !vis[row] {
            if !dfs(row, graph, &vis, &path) {
                return false
            }
        } else if path[row] {
            return false
        }
    }
    
    path[node] = false
    return true
}
