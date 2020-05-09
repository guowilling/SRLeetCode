import UIKit

// 747. 至少是其他数字两倍的最大数
//
// 链接: https://leetcode-cn.com/problems/largest-number-at-least-twice-of-others/
// 要点: 两次遍历, 一次求最大值和其索引, 一次判断最大值是否大于除自身外, 其他元素值的两倍
// 时间复杂度(n)
// 空间复杂度(1)

class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        var largest = 0, largestIndex = 0
        for (index, num) in nums.enumerated() {
            if num > largest {
                largest = num
                largestIndex = index
            }
        }
        for num in nums {
            if num == largest { continue }
            if largest < num * 2 { return -1 }
        }
        return largestIndex
    }
}

let s = Solution()
assert(s.dominantIndex([3, 6, 1, 0]) == 1)
assert(s.dominantIndex([1, 2, 3, 4]) == -1)
