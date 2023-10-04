import UIKit
import Foundation

struct Queue<T> {
    var elements: [T] = []
    
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
    
    var head: T? {
        return elements.first
    }
    
    var tail: T? {
        return elements.last
    }
}

class Graph {
    var n: Int
    var adj: [[Int]]
    
    init(n: Int) {
        self.n = n
        self.adj = Array(repeating: [], count: n)
    }
    
    // function to add an edge to graph
    func addEdge(v: Int, u: Int) {
        adj[v].append(u)
        adj[u].append(v)
    }
    
    // A BFS based function to check whether d is reachable from s.
    func isReachable(s: Int, d: Int) -> Bool {
        if s == d {
            return true
        }
        
        var visited = Array(repeating: false, count: n)
        var queue = Queue<Int>()
        queue.enqueue(s)
        
        while !queue.elements.isEmpty {
            // Dequeue a vertex from queue and print it
            let s = queue.dequeue()!
            
            for node in adj[s] {
                if node == d {
                    return true
                }
                
                if visited[s] == false {
                    visited[s] = true
                    queue.enqueue(node)
                    queue.enqueue(node)
                }
            }
        }
        
        return false
    }
}

let graph = Graph(n: 6)
graph.addEdge(v: 0, u: 1)
graph.addEdge(v: 1, u: 2)
graph.addEdge(v: 2, u: 0)

graph.addEdge(v: 3, u: 5)
graph.addEdge(v: 5, u: 4)
graph.addEdge(v: 4, u: 3)

graph.isReachable(s: 0, d: 5)

class Solution {
  func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
      let graph = edges.reduce(into: Array(repeating:[Int](), count:n)) { graph, edge in
          (0...1).forEach { i in graph[edge[i]].append(edge[i^1]) }
      }
      var visited = Set<Int>()
      var bfs = Set([source])
      while !bfs.isEmpty && !bfs.contains(destination) {
          visited = visited.union(bfs)
          bfs = Set(bfs.flatMap {graph[$0]}).subtracting(visited)
      }
      return !bfs.isEmpty
  }
}
