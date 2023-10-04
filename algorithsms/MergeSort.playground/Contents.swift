import UIKit

func mergeSort(arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    let middleArr = arr.count / 2
    let leftArr = mergeSort(arr: Array(arr[0..<middleArr]))
    let rightArr = mergeSort(arr: Array(arr[middleArr..<arr.count]))
    return merge(left: leftArr, right: rightArr)
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var leftIdx = 0
    var rightIdx = 0
    
    var orderArr: [Int] = []
    
    while leftIdx < left.count, rightIdx < right.count {
        if left[leftIdx] < right[rightIdx] {
            orderArr.append(left[leftIdx])
            leftIdx += 1
        } else if left[leftIdx] > right[rightIdx] {
            orderArr.append(right[rightIdx])
            rightIdx += 1
        } else {
            orderArr.append(right[rightIdx])
            orderArr.append(left[leftIdx])
            rightIdx += 1
            leftIdx += 1
        }
    }
    
    while leftIdx < left.count {
        orderArr.append(left[leftIdx])
        leftIdx += 1
    }
    
    while rightIdx < right.count {
        orderArr.append(right[rightIdx])
        rightIdx += 1
    }
    
    return orderArr
}
