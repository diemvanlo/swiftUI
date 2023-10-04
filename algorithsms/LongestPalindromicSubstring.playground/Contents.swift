import UIKit

func longestPalindrome(_ s: String) -> String {
    var result = ""
    
    for (index, char) in s.enumerated() {
        if index == s.count - 1 {
            break
        }
        
        var nextmatch = s.count
        while let nextIndex = s[0..<(nextmatch)].lastIndex(of: char)?.utf16Offset(in: s) {
            var subString = s[0..<(nextIndex+1)].substring(fromIndex: index)
            if isPalindrome(subString),
               result.count < subString.count {
                result = subString
            }
            nextmatch = nextIndex
        }
    }
    
    return result
}

func isPalindrome(_ s: String) -> Bool {
    guard s.count / 2 - 1 >= 2 else { return true }
    for i in 0...(s.count / 2 - 1) {
        if s[i] != s[s.count - 1 - i] {
            return false
        }
    }
    return true
}

extension String {
    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    func digitsOnly() -> String{
        let newString = components(separatedBy:CharacterSet.decimalDigits.inverted)
            .joined()
        
        return newString
    }
}
