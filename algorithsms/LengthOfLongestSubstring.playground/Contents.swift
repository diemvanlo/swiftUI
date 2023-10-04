import UIKit

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count != 0 else { return 0 }
    var minSpace = 0
    var listChar: [Character] = []
    
    for char in s {
        if let prev = listChar.firstIndex(of: char) {
            listChar.removeSubrange(0...prev)
        }
        listChar.append(char)
        minSpace = max(listChar.count, minSpace)
    }
    
    return minSpace
}

func isUniqueString(_ s: String) -> Bool {
    return s.count == Set(s).count
}
