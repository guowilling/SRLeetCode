import UIKit

// 167. 两数之和 II - 输入有序数组
//
// 链接: https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/
// 要点: 指针碰撞, 由于数组有序, 使用一头一尾双指针, 通过判断两数之和与目标值的关系相向遍历数组
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var index1 = 0
        var index2 = numbers.count - 1
        while index1 < index2 {
            let sum = numbers[index1] + numbers[index2]
            if sum < target {
                index1 += 1
            } else if sum > target {
                index2 -= 1
            } else {
                return [index1 + 1, index2 + 1]
            }
        }
        return []
    }
}

let s = Solution()
assert(s.twoSum([2, 7, 11, 15], 9) == [1, 2])
