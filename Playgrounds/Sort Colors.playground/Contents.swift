import UIKit

// 75. 颜色分类
//
// 链接: https://leetcode-cn.com/problems/sort-colors/
// 要点: 多指针的应用, 一个指针指向小端, 一个指针指向大端, 一个指针遍历数组
//      注意指针交换时的动作, 仅在与小端进行交换时前进, 因为与大端交换过来的元素未遍历过
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class Solution {
    func sortColors(_ nums: inout [Int]) {
        if nums.isEmpty { return }
        var current = 0, left = 0, right = nums.count - 1
        while current <= right {
            if nums[current] == 0 {
                nums.swapAt(left, current)
                left += 1
                current += 1
            } else if nums[current] == 2 {
                nums.swapAt(right, current)
                right -= 1
            } else {
                current += 1
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
