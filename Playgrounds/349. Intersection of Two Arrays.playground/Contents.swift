//
// 349. 两个数组的交集
//
// https://leetcode-cn.com/problems/intersection-of-two-arrays/
//
// 给定两个数组，编写一个函数来计算它们的交集。
//
// 示例 1：
// 输入：nums1 = [1,2,2,1], nums2 = [2,2]
// 输出：[2]
//
// 示例 2：
// 输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
// 输出：[9,4]
//
// 说明：
// 输出结果中的每个元素一定是唯一的。
// 我们可以不考虑输出结果的顺序。
//

/// O(nlogn), O(n)
func intersectionOfTwoArrays(nums1: [Int], nums2: [Int]) -> [Int] {
    var result = [Int]()
    var nums1Set = [Int]()
    for num in nums1 {
        if !nums1Set.contains(num) {
            nums1Set.append(num)
        }
    }
    for num in nums2 {
        if nums1Set.contains(num) {
            if !result.contains(num) {
                result.append(num)
            }
        }
    }
    return result
}

let nums1 = [1, 2, 2, 1]
let nums2 = [2, 2]
assert(intersectionOfTwoArrays(nums1: nums1, nums2: nums2) == [2], "Algorithm Error")

let nums3 = [4, 9, 5]
let nums4 = [9, 4, 9, 8, 4]
assert(intersectionOfTwoArrays(nums1: nums3, nums2: nums4) == [9, 4], "Algorithm Error")
