import UIKit

// 215. 数组中的第K个最大元素
//
// 链接: https://leetcode-cn.com/problems/kth-largest-element-in-an-array/
// 要点: 暂时用系统提供的排序函数完成此题, 但通过建堆的方式, 可以优化时间复杂度和空间复杂度
// 时间复杂度: O(nlogn)
// 空间复杂度: O(n)

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // 原地排序 sort(by:) 要比赋值排序 sorted(by:) 效率更高
//        return nums.sorted(by: >)[k - 1]
        var array = nums
        array.sort(by: >)
        return array[k - 1]
    }
}

let s = Solution()
s.findKthLargest([3, 2, 1, 5, 6, 4], 2)
s.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4)
