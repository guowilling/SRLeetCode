//
// 27. 移除元素
//
// https://leetcode-cn.com/problems/remove-element/
//
// 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。
// 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。
// 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
//
// 示例 1:
// 给定 nums = [3,2,2,3], val = 3,
// 函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。
// 你不需要考虑数组中超出新长度后面的元素。
//
// 示例 2:
// 给定 nums = [0,1,2,2,3,0,4,2], val = 2,
// 函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。
// 注意这五个元素可为任意顺序。
// 你不需要考虑数组中超出新长度后面的元素。
//
// 提示
// 尝试双指针法。
// 你是否使用“元素顺序可以更改”这一属性？
// 当要删除的元素很少时会发生什么？
//

/// O(n), O(1)
class Solution1 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.isEmpty { return 0 }
        var notValIndex = 0
        for num in nums {
            if num != val {
                nums[notValIndex] = num
                notValIndex += 1
            }
        }
        return notValIndex
    }
}

/// O(n), O(1)
class Solution2 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.isEmpty { return 0 }
        var index = 0
        var result = nums.count
        while index < result {
            if nums[index] == val {
                nums[index] = nums[result - 1]
                result -= 1
            } else {
                index += 1
            }
        }
        return result
    }
}

/// O(n), O(1)
class Solution3 {
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

let s = Solution3()
var input = [3, 2, 2, 3]
let newLen = s.removeElement(&input, 3)
assert(input == [2, 2])
assert(newLen == 2)
