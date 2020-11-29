//
// 20. 有效的括号
//
// 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
//
// 有效字符串需满足：
// 左括号必须用相同类型的右括号闭合。
// 左括号必须以正确的顺序闭合。
//
// 注意空字符串可被认为是有效字符串。
//
// 示例 1:
// 输入: "()"
// 输出: true
//
// 示例 2:
// 输入: "()[]{}"
// 输出: true
//
// 示例 3:
// 输入: "(]"
// 输出: false
//
// 示例 4:
// 输入: "([)]"
// 输出: false
//
// 示例 5:
// 输入: "{[]}"
// 输出: true
//


/// O(n), O(n)
class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 == 1 { return false }
        var stack: [String] = []
        let pairs = [
            ")": "(",
            "]": "[",
            "}": "{",
        ]
        for c in s {
            let char = String(c)
            if !pairs.keys.contains(char) {
                stack.append(char)
            } else {
                if stack.isEmpty || pairs[char] != stack.removeLast() {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
