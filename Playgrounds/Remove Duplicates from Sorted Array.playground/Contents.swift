import UIKit

// 26. 删除排序数组中的重复项
//
// 链接: https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/
// 要点: 数组变换, 使用双指针, 一个顺序遍历数组元素, 一个记录最后非重复元素的索引位置, 最后移除重复元素索引位置+1到末尾的元素
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var notDupIndex = 0
        for index in 1..<nums.count {
            if nums[index] != nums[notDupIndex] {
                notDupIndex += 1
                nums[notDupIndex] = nums[index]
            }
        }
        nums.removeLast(nums.count - (notDupIndex + 1))
        return nums.count
    }
}

let s = Solution()
var inputs = [1, 1, 2]
let newLen = s.removeDuplicates(&inputs)
assert(newLen == 2)
assert(inputs == [1, 2])
