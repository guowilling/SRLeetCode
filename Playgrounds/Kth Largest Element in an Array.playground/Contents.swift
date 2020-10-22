//
// 215. 数组中的第K个最大元素
//
// https://leetcode-cn.com/problems/kth-largest-element-in-an-array/
//
// 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
//
// 示例 1:
// 输入: [3,2,1,5,6,4] 和 k = 2
// 输出: 5
//
// 示例 2:
// 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
// 输出: 4
//
// 说明:
// 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
//
// 要点: 暂时用系统提供的排序函数完成此题, 但通过建堆的方式, 可以优化时间复杂度和空间复杂度
//

/// O(nlogn), O(n)
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // 原地排序 sort(by:) 要比赋值排序 sorted(by:) 效率更高
        
//        return nums.sorted(by: >)[k - 1]
        
        var array = nums
        array.sort(by: >)
        return array[k - 1]
    }
}

//let s = Solution()
//s.findKthLargest([3, 2, 1, 5, 6, 4], 2)
//s.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4)
