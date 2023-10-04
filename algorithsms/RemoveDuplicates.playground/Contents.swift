import UIKit

func removeDuplicates(_ s: String) -> String {
    var result = ""
    for c in s {
        if let lastC = result.last, lastC == c {
            result.removeLast()
            continue
        }
        result.append(c)
    }
    return result
}

let s = "abbaca"
print("mine \(removeDuplicates(s))")
