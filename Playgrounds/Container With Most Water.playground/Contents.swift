import UIKit

// 11. 盛最多水的容器
//
// 链接: https://leetcode-cn.com/problems/container-with-most-water/
// 要点: 指针碰撞, 使用一头一尾双指针相向遍历数组, area 保存目前为止可组成的最大面积,
//      每一步更新 area 使其始终为可组成的最大面积, 并将指向较短指针向较长那端移动
// 时间复杂度: O(n)
// 空间复杂度: O(1)

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var l = 0
        var r = height.count - 1
        var area = 0
        while l < r {
            let heightL = height[l]
            let heightR = height[r]
            area = max(area, (r - l) * min(heightL, heightR))
            if heightL < heightR {
                l += 1
            } else {
                r -= 1
            }
        }
        return area
    }
}

let s = Solution()
assert(s.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]) == 49)
