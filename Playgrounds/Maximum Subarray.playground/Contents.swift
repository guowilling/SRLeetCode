//
// 53. 最大子序和
//
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0
        var res = nums[0]

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
