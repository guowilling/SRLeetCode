//
// 203. 移除链表元素
//
// https://leetcode-cn.com/problems/remove-linked-list-elements/
//
// 删除链表中等于给定值 val 的所有节点。
//
// 示例:
// 输入: 1->2->6->3->4->5->6, val = 6
// 输出: 1->2->3->4->5
//

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

/// O(n), O(1)
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var prev = dummy
        var currNode = head
        while let curr = currNode {
            if curr.val == val {
                prev.next = curr.next
            } else {
                prev = curr
            }
            currNode = curr.next
        }
        return dummy.next
    }
}
