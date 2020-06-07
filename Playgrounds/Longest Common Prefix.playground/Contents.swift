import UIKit

// 14. 最长公共前缀
//
// 链接: https://leetcode-cn.com/problems/longest-common-prefix/
// 要点: 字符串的扫描遍历

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        
        var prefix = strs.first!
        for str in strs {
            while !str.hasPrefix(prefix) {
                prefix = String(prefix.dropLast())
            }
        }
        
        return prefix
    }
}

let s = Solution()
s.longestCommonPrefix(["flower","flow","flight"]) == "fl"
s.longestCommonPrefix(["dog","racecar","car"]) == ""
