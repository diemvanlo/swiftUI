import Cocoa

var list: ListNode? = ListNode(8)
for i in stride(from: 7, to: 0, by: -1) {
    list = ListNode(i, list)
}

list = reverseBetween(list, 2, 7)

func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    guard right - left > 0 else { return head }
    var prev = ListNode?.none
    var runner = head
    
    for _ in 1 ..< left { // advance `runner` to left node
        prev = runner
        runner = runner?.next
    }
    
    var (leftNodePrev, leftNode) = (prev, runner) // store for later
    
    for _ in left ..< right {
        // reverse nodes inside segment
        (runner!.next, runner, prev) = (prev, runner?.next, runner)
        // 1,3,2
        // 2.next => 1
        // runner = 3
        // prev = 2
        
        // 2, 4, 3
        // 3.next = 2
        // runner = 4
        // prev = 3
        
        // 3, 5, 4
        // 4.next = 3
        // runner = 5
        // prev = 4
    }
    
    leftNodePrev?.next = runner // point prior-to-left node to old right node
    leftNode?.next = runner?.next // point left node next to after old right node
    runner?.next = prev // point old right node next to prev node (reverse link direction)
    
    return left == 1 ? runner: head
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    
    func get(index: Int) -> ListNode? {
        var curr = 1
        var temp: ListNode? = self
        while temp != nil, curr < index {
            if temp?.next == nil {
                return nil
            }
            
            temp = temp?.next
            curr += 1
        }
        return temp
    }
}
