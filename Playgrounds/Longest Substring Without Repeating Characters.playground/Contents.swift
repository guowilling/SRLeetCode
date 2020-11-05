//
// 3. 无重复字符的最长子串
//
// https://leetcode-cn.com/problems/remove-element/
//
// 要点: 滑动窗口, 双指针
//

class Solution1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        
        let chars = [Character](s)
        var maxLen = 0
        var startIndex = 0
        var set = Set<Character>()
        
        for i in 0 ..< chars.count {
            let currChar = chars[i]
            if set.contains(currChar) {
                maxLen = max(maxLen, i - startIndex)
                while chars[startIndex] != currChar {
                    set.remove(chars[startIndex])
                    startIndex += 1
                }
                startIndex += 1
            } else {
                set.insert(currChar)
            }
        }
        
        return max(maxLen, chars.count - startIndex)
    }
}

class Solution2 {
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

class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        
        let chars = [Character](s)
        var left = 0
        var right = 0
        var maxLen = 0
        var dict: [Character: Int] = [:]
        
        while right < chars.count {
            let rightValue = chars[right]
            if let index = dict[rightValue] {
                left = max(left, index + 1)
            }
            dict[rightValue] = right
            right += 1
            maxLen = max(maxLen, right - left)
        }
        
        return maxLen
    }
}
