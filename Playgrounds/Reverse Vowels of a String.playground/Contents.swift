import UIKit

// 345. 反转字符串中的元音字母
//
// 链接: https://leetcode-cn.com/problems/reverse-vowels-of-a-string/
// 要点: 指针碰撞, 使用一头一尾双指针相向遍历数组, 跳过非元音字符
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class Solution {
    func reverseVowels(_ s: String) -> String {
        var chars = Array(s)
        var l = 0
        var r = chars.count - 1
        while l < r {
            while !chars[l].isVowel && l < r {
                l += 1
            }
            while !chars[r].isVowel && l < r {
                r -= 1
            }
            chars.swapAt(l, r)
            l += 1
            r -= 1
        }
        return String(chars)
    }
}

extension Character {
    var isVowel: Bool {
        let lower = lowercased()
        return ["a", "e", "i", "o", "u"].contains(lower)
    }
}

let s = Solution()
s.reverseVowels("hello") == "holle"
s.reverseVowels("leetcode") == "leotcede"
