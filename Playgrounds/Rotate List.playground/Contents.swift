import UIKit

// 61. 旋转链表

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else { return nil }
        guard head.next != nil else { return head }
        
        var node = head
        var n = 1
        while node.next != nil {
            node = node.next!
            n += 1
        }
        node.next = head
        
        var newTail = head
        for _ in 0..<(n - k % n - 1) {
            newTail = newTail.next!
        }
        
        let newHead = newTail.next
        newTail.next = nil
        
        return newHead
    }
}
