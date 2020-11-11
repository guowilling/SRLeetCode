//
// 209. 长度最小的子数组
//
// 链接: https://leetcode-cn.com/problems/minimum-size-subarray-sum/submissions/
//
// 给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的 连续 子数组，并返回其长度。如果不存在符合条件的子数组，返回 0。
//
// 示例：
// 输入：s = 7, nums = [2,3,1,2,4,3]
// 输出：2
// 解释：子数组 [4,3] 是该条件下的长度最小的子数组。
//

/// O(n2), O(1)
class Solution1 {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var ansLen = Int.max
        for i in 0..<nums.count {
            var sum = 0
            for j in i..<nums.count {
                sum += nums[j]
                if sum >= s {
                    ansLen = min(ansLen, j - i + 1)
                    break
                }
            }
        }
        return ansLen != Int.max ? ansLen : 0
    }
}

/// O(n), O(1)
class Solution2 {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var ansLen = Int.max
        var start = 0, end = 0
        var sum = 0
        while end < nums.count {
            sum += nums[end]
            while sum >= s {
                ansLen = min(ansLen, end - start + 1)
                sum -= nums[start]
                start += 1
            }
            end += 1
        }
        return ansLen != Int.max ? ansLen : 0
    }
}

let s = Solution2()
assert(s.minSubArrayLen(7, [2 ,3, 1, 2, 4, 3]) == 2)
assert(s.minSubArrayLen(6, [10, 2, 3]) == 1)
