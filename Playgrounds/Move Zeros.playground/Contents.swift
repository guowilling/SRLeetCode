import UIKit

// Move Zeros

// 给定一个数组 nums，写一个函数，将数组中所有的0挪到数组的末尾，⽽维持其他所有非0元素的相对位置。
// 举例: nums = [0, 1, 0, 3, 12]，函数运⾏后结果为[1, 3, 12, 0, 0]


// 解法一
// 时间复杂度: O(n)
// 空间复杂度: O(1)
func moveZeros2(nums: inout [Int]) -> [Int] {
    var k = 0
    for num in nums {
        if num != 0 {
            nums[k] = num
            k += 1
        }
    }
    for i in k..<nums.count {
        nums[i] = 0
    }
    return nums
}
var nums2 = [0, 1, 0, 3, 12]
moveZeros2(nums: &nums2)
assert(nums2 == [1, 3, 12, 0, 0], "Algorithm Error")

// 解法三
// 思路：非零元素与之前的零元素进行交换
// 时间复杂度: O(n)
// 空间复杂度: O(1)
func moveZeros3(nums: inout [Int]) -> [Int] {
    var k = 0
    for (i, num) in nums.enumerated() {
        if num != 0 {
            if k != i {
                let temp = nums[i]
                nums[i] = nums[k]
                nums[k] = temp
                k += 1
            } else {
                k += 1
            }
        }
    }
    return nums
}
var nums3 = [0, 1, 0, 3, 12]
moveZeros3(nums: &nums3)
assert(nums3 == [1, 3, 12, 0, 0], "Algorithm Error")
