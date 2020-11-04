//
// 14. 最长公共前缀
//
// https://leetcode-cn.com/problems/longest-common-prefix/
//
// 编写一个函数来查找字符串数组中的最长公共前缀。
// 如果不存在公共前缀，返回空字符串 ""。
//
// 示例 1:
// 输入: ["flower","flow","flight"]
// 输出: "fl"
//
// 示例 2:
// 输入: ["dog","racecar","car"]
// 输出: ""
// 解释: 输入不存在公共前缀。
//
// 说明:
// 所有输入只包含小写字母 a-z。
//

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        var prefix = strs[0]
        for str in strs {
            while !str.hasPrefix(prefix) {
                prefix = String(prefix.dropLast())
                if prefix.isEmpty { return prefix }
            }
        }
        return prefix
    }
}

let s = Solution()
s.longestCommonPrefix(["flower","flow","flight"]) == "fl"
s.longestCommonPrefix(["dog","racecar","car"]) == ""
