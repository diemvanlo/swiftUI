import UIKit

let tickets = [5,1,1,1]
print("mine \(timeRequiredToBuy(tickets, 0))")

func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
    var time = 0
    
    for index in 0..<tickets.count {
        if k >= index {
            time += min(tickets[k], tickets[index])
        } else if tickets[index] < tickets[k] {
            time += tickets[index]
        } else {
            time += min(tickets[k], tickets[index]) - 1
        }
    }
    
    return time
}
