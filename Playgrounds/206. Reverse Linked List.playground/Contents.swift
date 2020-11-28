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
/// 双指针
/// 1. 定义两个指针: prev 和 curr, prev 指向空, curr 指向 head
/// 2. 每次让 curr 的 next 指向 prev, 实现一次局部反转
/// 3. 然后让 prev 和 curr 同时向前移动一个位置
/// 4. 循环上面过程, 直到 prev 到达链表尾部
class Solution1 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        return prev
    }
}

/// 递归
class Solution2 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let reversedHead = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return reversedHead
    }
}
