import UIKit

let arr = [1, 4, 5, 2, 3, 54, 22]
print("mine \(quickSort(arr: arr))")

func quickSort(arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    let pivot = arr[arr.count/2]
    let left = arr.filter { $0 < pivot }
    let right = arr.filter { $0 > pivot }
    let equal = arr.filter { $0 == pivot }
    
    return quickSort(arr: left) + equal + quickSort(arr: right)
}
