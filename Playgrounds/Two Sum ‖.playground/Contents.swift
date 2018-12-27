import UIKit

// 167题: Two Sum ‖

// 给定一个已按照升序排列的有序数组，找到两个数使得它们相加之和等于目标数。
// 函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。
// 说明:
// 返回的下标值（index1 和 index2）不是从零开始的。
// 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。
// 示例:
// 输入: numbers = [2, 7, 11, 15], target = 9
// 输出: [1,2]
// 解释: 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。

// 思路:
// 初始化左指针 left 指向数组起始，初始化右指针 right 指向数组结尾。
// 根据已排序这个特性
//（1）如果 numbers[left] 与 numbers[right] 的和 tmp 小于 target，说明应该增加 tmp, 因此 left 右移指向一个较大的值。
//（2）如果 tmp 大于 target，说明应该减小 tmp, 因此 right 左移指向一个较小的值。
//（3）tmp 等于 target，则找到，返回 left+1 和 right+1。（注意以1为起始下标）

// 时间复杂度: O(n)
// 空间复杂度: O(1)
func twoSum(nums: [Int], target: Int) -> (index1: Int, index2: Int) {
    var index1 = 0
    var index2 = nums.count - 1
    while index1 < index2 {
        if (nums[index1] + nums[index2]) < target {
            index1 += 1
        } else if (nums[index1] + nums[index2]) > target {
            index2 -= 1
        } else {
            return (index1 + 1, index2 + 1)
        }
    }
    return (0, 0)
}
let nums = [2, 7, 11, 15]
let target = 9
print(twoSum(nums: nums, target: target))
