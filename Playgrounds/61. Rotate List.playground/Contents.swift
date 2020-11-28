//
// 61. 旋转链表
//
// https://leetcode-cn.com/problems/rotate-list/
//
// 给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。
//
// 示例 1:
// 输入: 1->2->3->4->5->NULL, k = 2
// 输出: 4->5->1->2->3->NULL
// 解释:
// 向右旋转 1 步: 5->1->2->3->4->NULL
// 向右旋转 2 步: 4->5->1->2->3->NULL
//
// 示例 2:
// 输入: 0->1->2->NULL, k = 4
// 输出: 2->0->1->NULL
// 解释:
// 向右旋转 1 步: 2->0->1->NULL
// 向右旋转 2 步: 1->2->0->NULL
// 向右旋转 3 步: 0->1->2->NULL
// 向右旋转 4 步: 2->0->1->NULL
//

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/// 找到旧的尾部并将其与链表头相连 oldTail.next = head，整个链表闭合成环，同时计算出链表的长度 n。
/// 找到新的尾部，第 (n - k % n - 1) 个节点 ，新的链表头是第 (n - k % n) 个节点。
/// 断开环 newTail.next = None，并返回新的链表头 new_head。
/// O(n), O(1)
class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        // base cases
        guard let head = head else { return nil }
        guard head.next != nil else { return head }
        
        // close the linked list into the ring
        var node = head
        var n = 1
        while node.next != nil {
            node = node.next!
            n += 1
        }
        node.next = head
        
        // find new tail : (n - k % n - 1)th node
        // and new head : (n - k % n)th node
        var newTail = head
        for _ in 0..<(n - k % n - 1) {
            newTail = newTail.next!
        }
        let newHead = newTail.next
        
        // break the ring
        newTail.next = nil
        
        return newHead
    }
}
