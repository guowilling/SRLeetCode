//
// 11. 盛最多水的容器
//
// https://leetcode-cn.com/problems/container-with-most-water/
//
// 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
//
// 说明：你不能倾斜容器，且 n 的值至少为 2。
//
// 示例：
// 输入：[1,8,6,2,5,4,8,3,7]
// 输出：49
//

/// O(n), O(1)
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

// 要点: 指针碰撞, 使用一头一尾双指针相向遍历数组, area 保存目前为止可组成的最大面积, 每一步更新 area 使其始终为可组成的最大面积, 并将指向较短指针向较长那端移动
