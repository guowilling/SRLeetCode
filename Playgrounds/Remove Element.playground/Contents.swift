import UIKit

// 27. 移除元素
//
// 链接: https://leetcode-cn.com/problems/remove-element/
// 要点: 数组变换, 快速排序的思想, 使用双指针, 一个顺序遍历数组元素, 一个记录最后非删除元素索引位置, 遍历到非删除元素并且两个指针位置不相等时就进行交换
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.isEmpty { return 0 }
        var notValIndex = 0
        for index in 0..<nums.count {
            if nums[index] != val {
                if index != notValIndex {
                    nums.swapAt(index, notValIndex)
                }
                notValIndex += 1
            }
        }
        nums.removeLast(nums.count - notValIndex)
        return nums.count
    }
}

let s = Solution()
var input = [3, 2, 2, 3]
let newLen = s.removeElement(&input, 3)
assert(input == [2, 2])
assert(newLen == 2)
