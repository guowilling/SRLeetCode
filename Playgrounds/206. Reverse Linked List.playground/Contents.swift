//
// 206. 反转链表
//
// https://leetcode-cn.com/problems/reverse-linked-list/
//
// 反转一个单链表。
// 示例:
//      输入: 1->2->3->4->5->NULL
//      输出: 5->4->3->2->1->NULL
//

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/// O(n), O(1)
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head
        while curr != nil {
            let nextTemp = curr?.next
            curr?.next = prev
            prev = curr
            curr = nextTemp
        }
        return prev
    }
}
