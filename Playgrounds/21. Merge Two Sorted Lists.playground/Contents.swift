//
// 21. 合并两个有序链表
//
// https://leetcode-cn.com/problems/merge-two-sorted-lists/submissions/
//
// 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
//
// 示例：
// 输入：1->2->4, 1->3->4
// 输出：1->1->2->3->4->4
//

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/// O(m+n), O(m+n)
class Solution1 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }

        if l1.val < l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
}

/// O(m+n), O(1)
class Solution2 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var prev = dummy
        var l1 = l1, l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                prev.next = l1
                l1 = l1?.next
            } else {
                prev.next = l2
                l2 = l2?.next
            }
            prev = prev.next!
        }
        if l1 != nil { prev.next = l1 }
        if l2 != nil { prev.next = l2 }
        return dummy.next
    }
}
