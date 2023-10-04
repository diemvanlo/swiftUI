//: [Previous](@previous)

import Foundation

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed
        var count = 0
        for (index, value) in flowerbed.enumerated() {
            let pre = index - 1
            let after = index + 1
            let isPreOccupied = pre >= 0 && flowerbed[pre] == 1
            let isAfterOccupied = after < flowerbed.count && flowerbed[after] == 1
            if !isAfterOccupied && !isPreOccupied && value == 0 {
                count += 1
                flowerbed[index] = 1
            }
        }
        return count >= n
    }
}
