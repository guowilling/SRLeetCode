//
// 剑指 Offer 03. 数组中重复的数字
//
// https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/
//
// 找出数组中重复的数字。
//
// 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。
// 数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。
//
// 示例 1：
// 输入：
// [2, 3, 1, 0, 2, 5, 3]
// 输出：2 或 3
//
// 限制：
// 2 <= n <= 1000
//

/// O(n), O(n)
class Solution1 {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            if !set.insert(num).inserted {
                return num
            }
        }
        return -1
    }
}

/// O(n), O(1)
class Solution2 {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var nums = nums
        for index in 0..<nums.count {
            if nums[index] != index {
                if nums[index] == nums[nums[index]] {
                    return nums[index]
                }
                (nums[index], nums[nums[index]]) = (nums[nums[index]], nums[index])
            }
        }
        return -1
    }
}
