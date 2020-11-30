//
// 125. 验证回文串
//
// https://leetcode-cn.com/problems/valid-palindrome/
//
// 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
//
// 说明：本题中，我们将空字符串定义为有效的回文串。
//
// 示例 1:
// 输入: "A man, a plan, a canal: Panama"
// 输出: true
//
// 示例 2:
// 输入: "race a car"
// 输出: false
//

/// O(n), O(n)
class Solution1 {
    func isPalindrome(_ s: String) -> Bool {
        let charsOriginal = Array(s.lowercased())
        var chars: [Character] = []
        for char in charsOriginal {
            if char.isLetter || char.isNumber {
                chars.append(char)
            }
        }
        var l = 0, r = chars.count - 1
        while l < r {
            if chars[l] != chars[r] {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }
}

/// O(n), O(n)
class Solution2 {
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
            if chars[l] != chars[r] {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }
}

let s = Solution2()
s.isPalindrome("A man, a plan, a canal: Panama")
s.isPalindrome("race a car")
