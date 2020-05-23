import UIKit

// 234. 回文链表

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return true }
        
        let firstHalfEnd = endOfFirstHalf(head)
        let secondHalfStart = reverseList(firstHalfEnd?.next)
        
        var p1 = head
        var p2 = secondHalfStart
        while p1 != nil && p2 != nil {
            if p1?.val != p2?.val {
                return false
            }
            p1 = p1?.next
            p2 = p2?.next
        }
        return true
    }
    
    private func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        var prev: ListNode? = nil
        var curr = head
        while curr != nil {
            let temp = curr?.next
            curr?.next = prev
            prev = curr
            curr = temp
        }
        return prev
    }
    
    private func endOfFirstHalf(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}
