//
// 234. 回文链表
//
// https://leetcode-cn.com/problems/palindrome-linked-list/
//
// 请判断一个链表是否为回文链表。
//
// 示例 1:
// 输入: 1->2
// 输出: false
//
// 示例 2:
// 输入: 1->2->2->1
// 输出: true
//

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/// O(n), O(n)
class Solution1 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return true }
        var curr = head
        var nodeVals: [Int] = []
        while curr != nil {
            nodeVals.append(curr!.val)
            curr = curr?.next
        }
        var left = 0
        var right = nodeVals.count - 1
        while left < right {
            if nodeVals[left] != nodeVals[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}

/// O(n), O(n)
class Solution2 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var frontP = head
        
        func _recursivelyCheck(_ currNode: ListNode?) -> Bool {
            if let node = currNode {
                if !_recursivelyCheck(node.next) {
                    return false
                }
                if node.val != frontP?.val {
                    return false
                }
                frontP = frontP?.next
            }
            return true
        }
        
        return _recursivelyCheck(head)
    }
}

/// O(n), O(1)
class Solution3 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return true }
        
        let firstHalfEnd = endOfFirstHalf(head)
        let secondHalfStart = reverseList(firstHalfEnd?.next)
        
        var p1 = head
        var p2 = secondHalfStart
        while p1 != nil && p2 != nil {
            if p1?.val != p2?.val {
                return false
            }
            p1 = p1?.next
            p2 = p2?.next
        }
        return true
    }
    
    private func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        var prev: ListNode? = nil
        var curr = head
        while curr != nil {
            let temp = curr?.next
            curr?.next = prev
            prev = curr
            curr = temp
        }
        return prev
    }
    
    private func endOfFirstHalf(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}
