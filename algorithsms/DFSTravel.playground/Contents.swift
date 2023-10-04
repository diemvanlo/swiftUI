import UIKit

func travelGrapp(_ graph: [[Int]]) {
    var vis = Array(repeating: false, count: graph.count)
    
    // Go through all the nodes
    for i in 0...(graph.count - 1) {
        if vis[i] {
            continue
        }
        dfs(node: i, graph, &vis)
    }
}

func dfs(node: Int,_ graph: [[Int]], _ vis: inout [Bool]) {
    // Mark current node as visited
    vis[node] = true
    
    graph[node].forEach { u in
        // Ignore already visited neighbors
        if vis[u] {
            return
        }
        // If not visited neighbor, recursively call DFS to process this
        dfs(node: u, graph, &vis)
    }
}
