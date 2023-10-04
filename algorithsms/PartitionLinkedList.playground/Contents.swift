import Cocoa

let arr = [2,1]
let list = ListNode.convert(arr: arr)
let v = partition(list, 2)
print("mine \(v)")

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    var headLess = ListNode?.none
    var less = ListNode?.none
    var cur = head
    var headGreater = ListNode?.none
    var greater = ListNode?.none
    
    while cur != nil {
        if cur?.val ?? 0 < x {
            let next = cur?.next
            if less == nil {
                less = cur
                headLess = cur
            } else {
                less?.next = cur
                less = cur
            }
            if headGreater != nil {
                cur?.next = headGreater
            }
            greater?.next = nil
            cur = next
        } else if cur?.val ?? 0 >= x {
            if headGreater == nil {
                headGreater = cur
            }
            greater?.next = cur
            greater = cur
            cur = cur?.next
        }
    }
    
    return headLess ?? head
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
    
    static func convert(arr: [Int]) -> ListNode? {
        var node = ListNode(arr.first!)
        var cur = node
        for i in 1..<arr.count {
            cur.next = ListNode(arr[i])
            cur = cur.next!
        }
        return node
    }
}
