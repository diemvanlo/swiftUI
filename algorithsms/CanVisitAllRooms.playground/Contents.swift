import UIKit

func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    var visit: [Bool] = Array(repeating: false, count: rooms.count)
    
    exploreRoom(rooms, visited: &visit, roomIndex: 0)
    
    return !visit.contains(where: { $0 == false })
}

func exploreRoom(_ rooms: [[Int]], visited: inout [Bool], roomIndex: Int) {
    if visited[roomIndex] == true {
        return
    }
    visited[roomIndex] = true
    rooms[roomIndex].forEach { idx in
        exploreRoom(rooms, visited: &visited, roomIndex: idx)
    }
}
