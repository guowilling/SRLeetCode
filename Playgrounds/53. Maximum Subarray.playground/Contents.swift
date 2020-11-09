//
// 53. 最大子序和
//
// https://leetcode-cn.com/problems/maximum-subarray/
//
// 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
//
// 示例:
// 输入: [-2,1,-3,4,-1,2,1,-5,4]
// 输出: 6
// 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
//

/// O(n), O(1)
class Solution1 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var res = nums[0]
        var sum = 0
        for num in nums {
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            res = max(res, sum)
        }
        return res
    }
}

/// O(n), O(1)
class Solution2 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var res = nums[0]
        var pre = 0
        for num in nums {
            pre = max(pre + num, pre)
            res = max(res, pre)
        }
        return res
    }
}
