import UIKit

// 66. 加一

// 链接: https://leetcode-cn.com/problems/plus-one/
// 要点: 逆序遍历, 加一后判断对10求余是否为0, 不为0则为结果直接返回即可. 为0则继续进位, 如果遍历结束仍未返回则添加一位最高位.
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        for i in stride(from: result.count - 1, through: 0, by: -1) {
            result[i] += 1
            result[i] = result[i] % 10
            if result[i] != 0 {
                return result
            }
        }
        result = Array(repeating: 0, count: result.count + 1)
        result[0] = 1
        return result
    }
}

let s = Solution()
assert(s.plusOne([1, 2, 3]) == [1, 2, 4])
assert(s.plusOne([4, 3, 2, 1]) == [4, 3, 2, 2])
assert(s.plusOne([9, 9, 9]) == [1, 0, 0, 0])
