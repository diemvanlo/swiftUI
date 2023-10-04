import UIKit

func isBipartite(_ graph: [[Int]]) -> Bool {
    let length = graph.count
    var vis = Array(repeating: false, count: length)
    var color: [Bool?] = Array(repeating: nil, count: length)
    
    for i in 0...(length-1) {
        guard !vis[i] else { continue }
        
        if !dfs(graph, &vis, &color, prevColor: true, node: i) {
            return false
        }
    }
    
    return true
}

func dfs(_ graph: [[Int]], _ vis: inout [Bool], _ color: inout [Bool?], prevColor: Bool, node: Int) -> Bool {
    vis[node] = true
    color[node] = !prevColor
    
    for row in graph[node] {
        if !vis[row] {
            if !dfs(graph, &vis, &color, prevColor: !prevColor, node: row) {
                return false
            }
        } else if color[row] != prevColor {
            return false
        }
    }
    
    return true
}
