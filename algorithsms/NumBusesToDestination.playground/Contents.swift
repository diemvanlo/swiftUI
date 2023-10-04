import UIKit

func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
    var visit: [[Int]: Bool] = [:]
    return travel(routes: routes, from: source, to: target, visit: &visit)
}

func travel(routes: [[Int]], from: Int, to: Int, visit: inout [[Int]: Bool]) -> Int {
    guard from != to else {
        return 0
    }
    
    var minStep = -1
    for index in 0..<routes.count {
        let bus = routes[index]
        guard bus.contains(where: { $0 == from }) else { continue }
        if bus.contains(to) {
            return 1
        }
        var routes = routes
        routes.remove(at: index)
        for stop in bus {
            guard visit[[index, stop]] != true else { continue }
            visit[[index, stop]] = true
            
            let availableSteps = travel(routes: routes, from: stop, to: to, visit: &visit) + 1
            if availableSteps != 0 {
                if minStep == -1 {
                    minStep = availableSteps
                } else {
                    minStep = min(minStep, availableSteps)
                }
            }
        }
    }
    return minStep
}

let routes = [[0,1,6,16,22,23],[14,15,24,32],[4,10,12,20,24,28,33],[1,10,11,19,27,33],[11,23,25,28],[15,20,21,23,29],[29]]
let num = numBusesToDestination(routes, 11, 29)
