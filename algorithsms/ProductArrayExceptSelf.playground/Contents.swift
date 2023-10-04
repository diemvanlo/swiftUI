import UIKit

func productArray(arr: [Int]) -> [Int] {
    let length = arr.count
    if length == 1 {
        return [0]
    }
    
    var left: [Int] = []
    var right: [Int] = Array(repeating: 1, count: length)
    var product: [Int] =  []
    left.append(1)
    
    for i in 1...(length - 1) {
        left.append(left[i-1] * arr[i-1])
    }
    
    for i in stride(from: length - 2, through: 0, by: -1) {
        right[i] = right[i+1] * arr[i+1]
    }
    
    for i in 0...(length - 1) {
        product.append(left[i] * right[i])
    }
    
    return []
}
