import UIKit

/// https://leetcode.com/problems/min-stack/?fbclid=IwAR0TM8cgtVVUiSB_bkxl_m3cInB8mtlMsCMkGF8QtaZn5PyioR5Sy0UWNeM
class MinStack {
    var topIndex: Int = 0
    var elements: [Int] = []

    init() {
        
    }
    
    func push(_ val: Int) {
        elements[topIndex] = val
        topIndex += 1
    }
    
    func pop() {
        topIndex -= 1
        elements = Array(elements[0..<topIndex])
    }
    
    func top() -> Int {
        return elements[topIndex]
    }
    
    func getMin() -> Int {
        var min = elements[0]
        elements.forEach { element in
            if element < min {
                min = element
            }
        }
        return min
    }
}
