//
// 66. 加一
//
// https://leetcode-cn.com/problems/plus-one/
//
// 给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。
// 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
// 你可以假设除了整数 0 之外，这个整数不会以零开头。
//
// 示例 1：
// 输入：digits = [1,2,3]
// 输出：[1,2,4]
// 解释：输入数组表示数字 123。
//
// 示例 2：
// 输入：digits = [4,3,2,1]
// 输出：[4,3,2,2]
// 解释：输入数组表示数字 4321。
//
// 示例 3：
// 输入：digits = [0]
// 输出：[1]
//
// 提示：
// 1 <= digits.length <= 100
// 0 <= digits[i] <= 9
//

/// O(n), O(1)
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        
        for i in stride(from: result.count - 1, through: 0, by: -1) {
            result[i] += 1
            result[i] = result[i] % 10
            if result[i] != 0 { return result }
        }
//        for (index, digit) in digits.enumerated().reversed() {
//            print(index, digit)
//            let temp = digit + 1
//            result[index] = temp % 10
//            if result[index] != 0 {
//                return result
//            }
//        }
        
        result = Array(repeating: 0, count: result.count + 1)
        result[0] = 1
        return result
    }
}

let s = Solution()
assert(s.plusOne([1, 2, 3]) == [1, 2, 4])
assert(s.plusOne([4, 3, 2, 1]) == [4, 3, 2, 2])
assert(s.plusOne([9, 9, 9]) == [1, 0, 0, 0])
