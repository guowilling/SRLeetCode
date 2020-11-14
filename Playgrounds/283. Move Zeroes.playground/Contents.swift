//
// 283. 移动零
//
// https://leetcode-cn.com/problems/move-zeroes/
//
// 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
//
// 示例:
// 输入: [0,1,0,3,12]
// 输出: [1,3,12,0,0]
//
// 说明:
// 必须在原数组上操作，不能拷贝额外的数组。
// 尽量减少操作次数。
//

class Solution1 {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.isEmpty || nums.count == 1 { return }
        var i = 0
        for num in nums {
            if num != 0 {
                nums[i] = num
                i += 1
            }
        }
        for j in i..<nums.count {
            nums[j] = 0
        }
    }
}

/// O(n), O(1)
/// 题解: 数组变换, 快速排序的思想, 使用双指针, 一个顺序遍历数组元素, 一个记录最后非零元素索引位置, 遍历到非零元素并且两个指针位置不相等时就进行交换
class Solution2 {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.isEmpty || nums.count == 1 { return }
        var notZeroIndex = 0
        for (index, num) in nums.enumerated() {
            if num != 0 {
                if index != notZeroIndex {
                    nums.swapAt(index, notZeroIndex)
                }
                notZeroIndex += 1
            }
        }
    }
}

let s = Solution2()
var input = [0, 1, 0, 3, 12]
s.moveZeroes(&input)
assert(input == [1, 3, 12, 0, 0])
