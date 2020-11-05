//
// 剑指 Offer 62. 圆圈中最后剩下的数字
//
// https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof/
//

// 0,1,,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字。求出这个圆圈里剩下的最后一个数字。
//
// 例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。
//
// 示例 1：
// 输入: n = 5, m = 3
// 输出: 3
//
// 示例 2：
// 输入: n = 10, m = 17
// 输出: 2
//
// 限制：
// 1 <= n <= 10^5
// 1 <= m <= 10^6

/// O(n2), O(n)
class Solution1 {
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        var nums: [Int] = []
        for i in 0..<n { nums.append(i) }
        var index = 0
        while nums.count > 1 {
            index = (index + m - 1) % nums.count
            nums.remove(at: index)
        }
        return nums[0]
    }
}

/// O(n), O(1)
class Solution2 {
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        var result = 0
        for i in 2...n {
            result = (result + m) % i
        }
        return result
    }
}

let s = Solution2()
s.lastRemaining(5, 3)
s.lastRemaining(10, 17)
