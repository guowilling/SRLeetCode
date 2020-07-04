//
// 15. 三数之和
//
// https://leetcode-cn.com/problems/3sum/
//
// 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。
//
// 注意：答案中不可以包含重复的三元组。
//
// 示例：
//      给定数组 nums = [-1, 0, 1, 2, -1, -4]，
//      满足要求的三元组集合为：
//      [
//        [-1, 0, 1],
//        [-1, -1, 2]
//      ]
//

/// O(n²), O(1)
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 { return [] }
        
        var result = [[Int]]()
        let sortedNums = nums.sorted()
        
        for i in 0..<sortedNums.count - 2 {
            if sortedNums[i] > 0 { break }
            if i > 0 && sortedNums[i] == sortedNums[i - 1] { continue }
            var l = i + 1
            var r = sortedNums.count - 1
            while l < r {
                let sum = sortedNums[i] + sortedNums[l] + sortedNums[r]
                if sum == 0 {
                    result.append([sortedNums[i], sortedNums[l], sortedNums[r]])
                    while l < r && sortedNums[l] == sortedNums[l + 1] {
                        l += 1
                    }
                    while l < r && sortedNums[r] == sortedNums[r - 1] {
                        r -= 1
                    }
                    l += 1
                    r -= 1
                } else if sum > 0 {
                    r -= 1
                    // 反而会增加执行时间
//                    while l < r && sortedNums[r] == sortedNums[r + 1] {
//                        r -= 1
//                    }
                } else {
                    l += 1
                    // 反而会增加执行时间
//                    while l < r && sortedNums[l] == sortedNums[l - 1] {
//                        l += 1
//                    }
                }
            }
        }
        
        return result
    }
}

let s = Solution()
let testNums = [-1, 0, 1, 2, -1, -4]
s.threeSum(testNums)
