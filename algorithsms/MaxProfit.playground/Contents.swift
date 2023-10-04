import UIKit

func maxProfit(prices: [Int]) -> Int {
    var maxProfit = 0
    
    for i in 1...(prices.count-1) {
        if prices[i] > prices[i-1] {
            maxProfit += prices[i] - prices[i-1]
        }
    }
    
    return maxProfit
}
