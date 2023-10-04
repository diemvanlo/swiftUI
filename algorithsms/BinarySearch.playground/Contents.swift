import Cocoa

func binarySearch(arr: [Int], target: Int) -> Int {
//    guard var low = arr.first, var high = arr.last else { return -1 }
    let length = arr.count
    var low = 0
    var high = length - 1
    
    while low < high {
        let mid = (low + high) / 2
        
        if arr[mid] == target {
            return mid
        }
        
        if arr[mid] > target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return -1
}
