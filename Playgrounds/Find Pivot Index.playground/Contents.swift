import UIKit

// 724. 寻找数组的中心索引
//
// 链接: https://leetcode-cn.com/problems/find-pivot-index/
// 要点: 两次遍历, 一次求总和, 一次渐进判断求和
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, +)
        var current = 0
        for (index, num) in nums.enumerated() {
            if sum - num - current == current {
                return index
            }
            current += num
        }
        return -1
    }
}

let s = Solution()
assert(s.pivotIndex([1, 7, 3, 6, 5, 6]) == 3)
assert(s.pivotIndex([1, 2, 3]) == -1)
