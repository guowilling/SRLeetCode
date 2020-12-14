//
// 24. 两两交换链表中的节点
//
// 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
// 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
//
// 示例 1：
// 输入：head = [1,2,3,4]
// 输出：[2,1,4,3]
//
// 示例 2：
// 输入：head = []
// 输出：[]
//
// 示例 3：
// 输入：head = [1]
// 输出：[1]
//

class ListNode {
    var val: Int
    var next: ListNode?
    init (_ val: Int) {
        self.val = val
    }
}

/// 递归
/// O(n), O(n)
class Solution1 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let node1 = head, let node2 = node1.next else { return head }
        node1.next = swapPairs(node2.next)
        node2.next = node1
        return node2
    }
}

/// 迭代
/// O(n), O(1)
class Solution2 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var temp = dummy
        
        while let node1 = temp.next, let node2 = node1.next {
            temp.next = node2
            node1.next = node2.next
            node2.next = node1
            temp = node1
        }
        
        return dummy.next
    }
}
