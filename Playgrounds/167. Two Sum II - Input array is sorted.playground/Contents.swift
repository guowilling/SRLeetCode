//
// 167. 两数之和 II - 输入有序数组
//
// https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/
//
// 给定一个已按照升序排列的有序数组，找到两个数使得它们相加之和等于目标数。
//
// 函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。
//
// 说明:
//      返回的下标值（index1 和 index2）不是从零开始的。
//      你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。
//
// 示例:
//      输入: numbers = [2, 7, 11, 15], target = 9
//      输出: [1,2]
//      解释: 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。
//

/// O(n), O(1)
/// - 题解: 指针碰撞, 由于数组有序, 使用一头一尾双指针, 通过判断两数之和与目标值的关系相向遍历数组
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
