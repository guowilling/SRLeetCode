//
// 141. 环形链表
//
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        
        var slow = head
        var fast = head?.next
        
        while slow !== fast {
            if fast == nil || fast?.next == nil {
                return false
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return true
    }
}
