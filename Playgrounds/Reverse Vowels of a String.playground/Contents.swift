//
// 345. 反转字符串中的元音字母
//
// https://leetcode-cn.com/problems/reverse-vowels-of-a-string/
//
// 编写一个函数，以字符串作为输入，反转该字符串中的元音字母。
//
// 示例 1：
// 输入："hello"
// 输出："holle"
//
// 示例 2：
// 输入："leetcode"
// 输出："leotcede"
//

/// O(n), O(1)
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
