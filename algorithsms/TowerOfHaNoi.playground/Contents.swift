import UIKit

func move(n: Int, start: Int = 1, temp: Int = 2, end: Int = 3) {
    guard n != 1 else {
        print("mine move \(n) from: \(produce(n: start)) to: \(produce(n: end))")
        return
    }
    
    move(n: n - 1, start: start, temp: end, end: temp)
    print("mine move \(n) from: \(produce(n: start)) to: \(produce(n: end))")
    move(n: n - 1, start: temp, temp: start, end: end)
}

func produce(n: Int) -> String {
    switch n {
    case 1: return "A"
    case 2: return "B"
    case 3: return "C"
    default: return ""
    }
}
