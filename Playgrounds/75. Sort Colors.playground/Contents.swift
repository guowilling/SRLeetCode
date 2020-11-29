//
// 75. 颜色分类
//
// https://leetcode-cn.com/problems/sort-colors/
//
// 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
// 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
//
// 进阶：
// 你可以不使用代码库中的排序函数来解决这道题吗？
// 你能想出一个仅使用常数空间的一趟扫描算法吗？
//
// 示例 1：
// 输入：nums = [2,0,2,1,1,0]
// 输出：[0,0,1,1,2,2]
//
// 示例 2：
// 输入：nums = [2,0,1]
// 输出：[0,1,2]
//
// 示例 3：
// 输入：nums = [0]
// 输出：[0]
//
// 示例 4：
// 输入：nums = [1]
// 输出：[1]
//
// 提示：
// n == nums.length
// 1 <= n <= 300
// nums[i] 为 0、1 或 2
//

/// 单指针, 两次遍历, 第一次排序所有的红色(0), 第二次排序所有的白色(1), 剩下所有的蓝色(2)也就排好序了
/// O(n), O(1)
class Solution1 {
    func sortColors(_ nums: inout [Int]) {
        var curr = 0
        for index in 0..<nums.count {
            if nums[index] == 0 {
                nums.swapAt(index, curr)
                curr += 1
            }
        }
        let left = curr
        for index in left..<nums.count {
            if nums[index] == 1 {
                nums.swapAt(index, curr)
                curr += 1
            }
        }
    }
}

/// 双指针, 一次遍历
/// O(n), O(1)
class Solution2 {
    func sortColors(_ nums: inout [Int]) {
        var p0 = 0
        var p1 = 0
        for (index, num) in nums.enumerated() {
            if num == 1 {
                nums.swapAt(index, p1)
                p1 += 1
            } else if num == 0 {
                nums.swapAt(index, p0)
                if p0 < p1 {
                    nums.swapAt(index, p1)
                }
                p0 += 1
                p1 += 1
            }
        }
    }
}

/// 多指针
/// O(n), O(1)
class Solution {
    func sortColors(_ nums: inout [Int]) {
        if nums.isEmpty { return }
        var curr = 0, left = 0, right = nums.count - 1
        while curr <= right {
            if nums[curr] == 0 {
                nums.swapAt(left, curr)
                left += 1
                curr += 1
            } else if nums[curr] == 2 {
                nums.swapAt(right, curr)
                right -= 1
            } else {
                curr += 1
            }
        }
    }
}

let s = Solution()
do {
    var input = [2, 0, 2, 1, 1, 0]
    let expectOutput = [0, 0, 1, 1, 2, 2]
    s.sortColors(&input)
    assert(input == expectOutput)
}

do {
    var input = [1, 2, 0]
    let expectOutput = [0, 1, 2]
    s.sortColors(&input)
    assert(input == expectOutput)
}
