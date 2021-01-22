//
// 34. 在排序数组中查找元素的第一个和最后一个位置
//
// https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/
//
// 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
// 如果数组中不存在目标值 target，返回 [-1, -1]。
//
// 进阶：
// 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
//
// 示例 1：
// 输入：nums = [5,7,7,8,8,10], target = 8
// 输出：[3,4]
//
// 示例 2：
// 输入：nums = [5,7,7,8,8,10], target = 6
// 输出：[-1,-1]
//
// 示例 3：
// 输入：nums = [], target = 0
// 输出：[-1,-1]
//

/// O(n), O(1)
class Solution1 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0, right = nums.count - 1
        while left <= right {
            if nums[left] == target && nums[right] == target {
                return [left, right]
            }
            if nums[left] != target {
                left += 1
            }
            if nums[right] != target {
                right -= 1
            }
        }
        return [-1, -1]
    }
}

/// O(logN), O(1)
class Solution2 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty { return [-1, -1] }
        let firstP = findFirstPosition(nums, target)
        if firstP == -1 { return [-1, -1] }
        let lastP = findLastPosition(nums, target)
        return [firstP, lastP]
    }
    
    func findFirstPosition(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                right = mid
            } else if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid
            }
        }
        if left == nums.count { return -1 }
        return nums[left] == target ? left : -1
    }
    
    func findLastPosition(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                left = mid + 1
            } else if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid
            }
        }
        if left == 0 { return -1 }
        return nums[left - 1] == target ? (left - 1) : -1
    }
}
