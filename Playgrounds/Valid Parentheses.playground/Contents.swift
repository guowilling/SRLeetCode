//
// 20. 有效的括号
// 时间复杂度: O(N)
// 空间复杂度: O(N)
//

class Solution {
    func isValid(_ s: String) -> Bool {
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
