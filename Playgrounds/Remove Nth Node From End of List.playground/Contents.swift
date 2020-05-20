import UIKit

// 19. 删除链表的倒数第N个节点

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var slow: ListNode? = dummy
        var fast: ListNode? = dummy
        for _ in 0..<n {
            if let next = fast?.next {
                fast = next
            }
        }
        while fast?.next != nil {
            slow = slow!.next
            fast = fast!.next
        }
        slow?.next = slow?.next?.next
        return dummy.next
    }
}
