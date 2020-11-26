//
// 19. 删除链表的倒数第N个节点
//
// https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
//
// 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
//
// 示例：
// 给定一个链表: 1->2->3->4->5, 和 n = 2.
// 当删除了倒数第二个节点后，链表变为 1->2->3->5.
//
// 说明：
// 给定的 n 保证是有效的。
// 进阶：
// 你能尝试使用一趟扫描实现吗？
//

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

/// 计算链表长度
/// O(n), O(1)
class Solution1 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let length = lengthOf(listNode: head)
        let dummy = ListNode(0)
        dummy.next = head
        var curr = dummy
        
        for _ in 0..<(length - n) {
            curr = curr.next!
        }
        curr.next = curr.next?.next
        
        return dummy.next
    }
    
    func lengthOf(listNode head: ListNode?) -> Int {
        var length = 0
        var head = head
        while head != nil {
            length += 1
            head = head?.next
        }
        return length
    }
}

/// 栈
/// O(n), O(n)
class Solution2 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var stack: [ListNode] = []
        var curr = dummy
        
        while curr.next != nil {
            stack.append(curr)
            curr = curr.next!
        }
        for _ in 0..<(n-1) {
            stack.popLast()
        }
        let prev = stack.last
        prev?.next = prev?.next?.next
        
        return dummy.next
    }
}

/// 一次遍历
/// O(n), O(1)
class Solution3 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var slow: ListNode? = dummy
        var fast: ListNode? = dummy
        
        for _ in 0..<n {
            fast = fast?.next
        }
        while fast?.next != nil {
            slow = slow!.next
            fast = fast!.next
        }
        slow?.next = slow?.next?.next
        
        return dummy.next
    }
}
