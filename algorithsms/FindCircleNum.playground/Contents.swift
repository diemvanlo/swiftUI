import UIKit

let isConnected = [[1,0,0],[0,1,0],[0,0,1]]

func findCircleNum(_ isConnected: [[Int]]) -> Int {
    var visited = Array(repeating: false, count: isConnected.count)
    var count = 0
    
    for index in 0..<isConnected.count {
        if visited[index] == true {
            continue
        }
        markProvince(isConnected, visited: &visited, index: index)
        count += 1
    }
    
    return count
}

func markProvince(_ isConnected: [[Int]], visited: inout [Bool], index: Int) {
    if visited[index] == true {
        return
    }
    visited[index] = true
    for j in 0..<isConnected[index].count {
        if visited[j] || isConnected[index][j] == 0 {
            continue
        }
        markProvince(isConnected, visited: &visited, index: j)
    }
}
