import UIKit

func isPowerOfFour(_ n: Int) -> Bool {
    if n <= 0 {
        return false
    } else if n == 1 {
        return true
    } else if n % 4 != 0 {
        return false
    }
    
    return isPowerOfFour(n / 4)
}
