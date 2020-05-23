import UIKit

// 203. 移除链表元素

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var prev = dummy
        var currOptional = head
        while let curr = currOptional {
            if curr.val == val {
                prev.next = curr.next
            } else {
                prev = curr
            }
            currOptional = curr.next
        }
        return dummy.next
    }
}
