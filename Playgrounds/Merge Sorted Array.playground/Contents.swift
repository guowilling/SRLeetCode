//
// 88. 合并两个有序数组
//
// https://leetcode-cn.com/problems/merge-sorted-array/
//
// 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
//
// 说明：
// 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
// 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
//
// 示例：
// 输入：
// nums1 = [1,2,3,0,0,0], m = 3
// nums2 = [2,5,6],       n = 3
// 输出：[1,2,2,3,5,6]
//
// 提示：
// -10^9 <= nums1[i], nums2[i] <= 10^9
// nums1.length == m + n
// nums2.length == n
//

/// O((m+n)log(m+n)), O(1)
class Solution1 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: inout [Int], _ n: Int) {
        nums1.replaceSubrange(m..<m+n, with: nums2)
        nums1.sort()
    }
}

/// O(n+m), O(m)
class Solution2 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: inout [Int], _ n: Int) {
        let nums1Copy = nums1[0..<m]
        var p1 = 0
        var p2 = 0
        var p = 0
        while p1 < m && p2 < n {
            if nums1Copy[p1] < nums2[p2] {
                nums1[p] = nums1Copy[p1]
                p1 += 1
            } else {
                nums1[p] = nums2[p2]
                p2 += 1
            }
            p += 1
        }
        if p1 < m {
            nums1.replaceSubrange(p..<(p+m-p1), with: nums1Copy[p1..<m])
        }
        if p2 < n {
            nums1.replaceSubrange(p..<(p+n-p2), with: nums2[p2..<n])
        }
    }
}

/// 使用双指针, 逆序遍历, 避免拷贝增加不必要的空间复杂度
/// O(m + n), O(1)
class Solution3 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: inout [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        while p2 >= 0 {
            if p1 >= 0 && nums1[p1] > nums2[p2] {
                nums1[p1 + p2 + 1] = nums1[p1]
                p1 -= 1
            } else {
                nums1[p1 + p2 + 1] = nums2[p2]
                p2 -= 1
            }
        }
    }
}

let s = Solution3()
var nums1 = [1, 2, 3, 0, 0, 0]
var nums2 = [2, 5, 6]
s.merge(&nums1, 3, &nums2, 3)
assert(nums1 == [1, 2, 2, 3, 5, 6])
