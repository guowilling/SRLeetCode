import UIKit

// 125. 验证回文串
//
// 链接: https://leetcode-cn.com/problems/valid-palindrome/
// 要点: 指针碰撞, 使用一头一尾双指针相向遍历数组, 跳过非比较字符
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s.lowercased())
        var l = 0
        var r = chars.count - 1
        while l < r {
            while !chars[l].isLetter && !chars[l].isNumber && l < r {
                l += 1
            }
            while !chars[r].isLetter && !chars[r].isNumber && l < r {
                r -= 1
            }
            if chars[l] == chars[r] {
                l += 1
                r -= 1
            } else {
                return false
            }
        }
        return true
    }
}

let s = Solution()
s.isPalindrome("A man, a plan, a canal: Panama")
s.isPalindrome("race a car")
