//
// 2. 两数相加
//
// 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
//
// 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
//
// 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
//
// 示例：
//      输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
//      输出：7 -> 0 -> 8
//      原因：342 + 465 = 807
//

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/// O(max(m,n)), O(max(m,n))
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var node = dummy
        var l1 = l1
        var l2 = l2
        var carry = 0
        
        while l1 != nil || l2 != nil {
            let v1 = l1?.val ?? 0
            let v2 = l2?.val ?? 0
            let sum = v1 + v2 + carry
            carry = sum / 10
            node.next = ListNode(sum % 10)
            
            if l1 != nil { l1 = l1?.next }
            if l2 != nil { l2 = l2?.next }
            node = node.next!
        }
        
        if carry > 0 {
            node.next = ListNode(carry)
        }
        
        return dummy.next
    }
}
