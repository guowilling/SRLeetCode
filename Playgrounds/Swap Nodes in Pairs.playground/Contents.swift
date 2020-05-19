import UIKit

// 24. 两两交换链表中的节点

class ListNode {
    var val: Int
    var next: ListNode?
    init (_ val: Int) {
        self.val = val
    }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let first = head, let second = first.next else { return head }
        first.next = swapPairs(second.next)
        second.next = first
        return second
    }
}
