import UIKit

// 283. 移动零
//
// 链接: https://leetcode-cn.com/problems/move-zeroes/
// 要点: 数组变换, 快速排序的思想, 使用双指针, 一个顺序遍历数组元素, 一个记录最后非零元素索引位置, 遍历到非零元素并且两个指针位置不相等时就进行交换
// 时间复杂度(n)
// 空间复杂度(1)

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.isEmpty || nums.count == 1 { return }
        var notZeroIndex = 0
        for (index, num) in nums.enumerated() {
            if num != 0 {
                if notZeroIndex != index {
                    nums.swapAt(notZeroIndex, index)
                }
                notZeroIndex += 1
            }
        }
    }
}

let s = Solution()
var input = [0, 1, 0, 3, 12]
s.moveZeroes(&input)
assert(input == [1, 3, 12, 0, 0])
