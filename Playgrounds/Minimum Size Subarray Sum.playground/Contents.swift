import UIKit

// 209. 长度最小的子数组
//
// 链接: https://leetcode-cn.com/problems/minimum-size-subarray-sum/submissions/
// 要点: 快慢指针, 使用一个 left 指针指向起始位置, 另使用一个 i 指针向前遍历并累加求和
//      如果累加结果大于目标值, 更新 len, 并将累加和减去 left 指向的值, left 向前移动1后, 重复比较累加结果和目标值
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var left = 0
        var sum = 0
        var len = Int.max
        for i in 0..<nums.count {
            sum += nums[i]
            while sum >= s {
                len = min(len, i + 1 - left)
                sum -= nums[left]
                left += 1
            }
        }
        return len != Int.max ? len : 0
    }
}

let s = Solution()
assert(s.minSubArrayLen(7, [2 ,3, 1, 2, 4, 3]) == 2)
assert(s.minSubArrayLen(6, [10, 2, 3]) == 1)
