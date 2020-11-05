//
// 3. 无重复字符的最长子串
//
// https://leetcode-cn.com/problems/remove-element/
//
// 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
//
// 示例 1:
// 输入: "abcabcbb"
// 输出: 3
// 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
//
// 示例 2:
// 输入: "bbbbb"
// 输出: 1
// 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
//
// 示例 3:
// 输入: "pwwkew"
// 输出: 3
// 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
// 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
//

/// O(n), O(Σ)
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        
        let chars = [Character](s)
        var left = 0
        var right = 0
        var maxLen = 0
        var set = Set<Character>()
        
        while right < chars.count {
            if set.contains(chars[right]) {
                set.remove(chars[left])
                left += 1
            } else {
                set.insert(chars[right])
                right += 1
                maxLen = max(maxLen, right - left)
            }
        }
        
        return maxLen
    }
}

let s = Solution()
s.lengthOfLongestSubstring("abcabcbb") == 3
s.lengthOfLongestSubstring("bbbbb") == 1
s.lengthOfLongestSubstring("pwwkew") == 3
s.lengthOfLongestSubstring("a") == 1
s.lengthOfLongestSubstring(" ") == 1
s.lengthOfLongestSubstring("tmmzuxt") == 5
