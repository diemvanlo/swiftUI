import UIKit

func maxArea(_ height: [Int]) -> Int {
    var maxArea = 0
    
    var low = 0
    var high = height.count - 1
    
    while low < high {
        let area = (high - low) * min(height[low], height[high])
        maxArea = max(area, maxArea)
        
        if height[low] < height[high] {
            low += 1
        } else {
            high -= 1
        }
    }
    
    return maxArea
}
