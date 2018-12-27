import UIKit

// 1题: Two Sum

// 给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
// 你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
// 示例:
// 给定 nums = [2, 7, 11, 15], target = 9
// 因为 nums[0] + nums[1] = 2 + 7 = 9
// 所以返回 [0, 1]

// 时间复杂度(n2)
// 空间复杂度(n)
func twoSum(nums: [Int], target: Int) -> (index1: Int, index2: Int) {
    var numsMap = [Int: Int]()
    var matching = 0
    for (i, num) in nums.enumerated() {
        matching = target - num
        print(matching)
        for (key, value) in numsMap {
            if value == matching {
                return (key + 1, i + 1)
            }
        }
        numsMap[i] = num
        print(numsMap)
    }
    return (0, 0)
}
let nums = [2, 7, 11, 15]
let target = 9
print(twoSum(nums: nums, target: target))
