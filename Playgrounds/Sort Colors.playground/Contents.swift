import UIKit

// Sort Colors

// 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
// 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
// 注意: 不能使用代码库中的排序函数来解决这道题。
// 示例:
// 输入: [2,0,2,1,1,0]
// 输出: [0,0,1,1,2,2]

// 思路: 结合三路快排 partition 的应用
// 设置两个索引, zero(初始值为 -1)从左往右增加, two(初始值为数组大小)从右往左减小
// 遍历 nums, 当 nums[i] == 1 时, i++
// 当 nums[i] == 2 时, 先 two--, 再交换 nums[i] 与 nums[two]
// 当 nums[i] == 0 时, 先 zero++, 再交换 nums[i] 与 nums[zero], 再 i++
// 当 i == two 时结束循环

// 时间复杂度: O(n)
// 空间复杂度: O(1)

func sortColors(nums: inout [Int]) -> [Int] {
    var zero = -1
    var two = nums.count
    var i = 0
    while i < two {
        if nums[i] == 1 {
            i += 1
        } else if nums[i] == 2 {
            two -= 1
            let temp = nums[i]
            nums[i] = nums[two]
            nums[two] = temp
        } else {
            zero += 1
            let temp = nums[zero]
            nums[zero] = nums[i]
            nums[i] = temp
            i += 1
        }
    }
    return nums
}

var nums = [2, 0, 2, 1, 1, 0]
sortColors(nums: &nums)
assert(nums == [0, 0, 1, 1, 2, 2], "Algorithm Error")
