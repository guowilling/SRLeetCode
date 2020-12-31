//
// 46. 全排列
//
// https://leetcode-cn.com/problems/permutations/
//
// 给定一个 没有重复 数字的序列，返回其所有可能的全排列。
//
// 示例:
//
// 输入: [1,2,3]
// 输出:
// [
//   [1,2,3],
//   [1,3,2],
//   [2,1,3],
//   [2,3,1],
//   [3,1,2],
//   [3,2,1]
// ]
//

class Solution {
    
    var result: [[Int]] = []
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var track: [Int] = []
        backtrack(nums, track: &track)
        return result
    }
    
    func backtrack(_ nums: [Int], track: inout [Int]) {
        if track.count == nums.count {
            result.append(track)
            return
        }
        for i in 0..<nums.count {
            if track.contains(nums[i]) { continue }
            track.append(nums[i])
            backtrack(nums, track: &track)
            track.removeLast()
        }
    }
}
