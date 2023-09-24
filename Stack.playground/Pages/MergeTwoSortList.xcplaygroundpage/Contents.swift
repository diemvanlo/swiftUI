//: [Previous](@previous)

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ x: Int) {
        self.val = x
        self.next = nil
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // write your code here
        let temp = ListNode(-1)
        var head: ListNode? = temp
        var listNode1 = l1
        var listNode2 = l2
        
        while listNode1?.val != nil && listNode2?.val != nil {
            if (listNode1!.val > listNode2!.val) == true {
                head = listNode1
                listNode1 = listNode1?.next
            } else {
                head = listNode2
                listNode2 = listNode2?.next
            }
        }
        
        head?.next = listNode1 == nil ? listNode2 : listNode1
        
        return temp.next
    }
}
