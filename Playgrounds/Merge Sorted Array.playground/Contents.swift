import UIKit

// 88. 合并两个有序数组
//
// 链接: https://leetcode-cn.com/problems/merge-sorted-array/
// 要点: 使用双指针, 逆序遍历, 避免拷贝增加不必要的空间复杂度
// 时间复杂度: O(m + n)
// 空间复杂度: O(1)

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: inout [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        while p1 >= 0 || p2 >= 0 {
            if p2 < 0 || (p1 >= 0 && nums1[p1] > nums2[p2]) {
                nums1[p1 + p2 + 1] = nums1[p1]
                p1 -= 1
            } else {
                nums1[p1 + p2 + 1] = nums2[p2]
                p2 -= 1
            }
        }
    }
}

let s = Solution()
var nums1 = [1, 2, 3, 0, 0, 0]
var nums2 = [2, 5, 6]
s.merge(&nums1, 3, &nums2, 3)
assert(nums1 == [1, 2, 2, 3, 5, 6])
