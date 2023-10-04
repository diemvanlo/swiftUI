import UIKit

var greeting = "Hello, playground"

func girdTraveller(m: Int, n: Int, memo: inout [String: Int]) -> Int {
    let key = "\(m)\(n)"
    if let previousMemo = memo[key] { return previousMemo }
    if m == 1, n == 1 {
        return 1
    } else if m == 0 || n == 0 {
        return 0
    }
    var tempMemo = memo
    memo[key] = girdTraveller(m: m - 1, n: n, memo: &memo) + girdTraveller(m: m, n: n - 1, memo: &memo)
    return memo[key]!
}

var memo: [String: Int] = [:]

//print("mine \(girdTraveller(m: 3, n: 2, memo: &memo))")
//print("mine \(girdTraveller(m: 3, n: 3, memo: &memo))")
print("mine \(girdTraveller(m: 18, n: 18, memo: &memo))")
