import UIKit

// 1003. 检查替换后的词是否有效
// 时间复杂度：O(n)
// 空间复杂度：O(1)

class Solution {
    func isValid(_ S: String) -> Bool {
//        var s = S
//        while s.contains("abc") {
//            s = s.replacingOccurrences(of: "abc", with: "")
//        }
//        return s.isEmpty
        
        // 最优解
        var stack: [Character] = []
        for char in S {
            if char == "c" {
                if stack.popLast() != "b" {
                    return false
                }
                if stack.popLast() != "a" {
                    return false
                }
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}

let s = Solution()
assert(s.isValid("aabcbc"))
assert(s.isValid("abcabcababcc"))
assert(!s.isValid("abccba"))
assert(!s.isValid("cababc"))
