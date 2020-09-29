//
// 70. 爬楼梯
//
// https://leetcode-cn.com/problems/climbing-stairs/
//
// 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
//
// 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
//
// 注意：给定 n 是一个正整数。
//
// 示例 1：
// 输入： 2
// 输出： 2
// 解释： 有两种方法可以爬到楼顶。
// 1.  1 阶 + 1 阶
// 2.  2 阶
//
// 示例 2：
// 输入： 3
// 输出： 3
// 解释： 有三种方法可以爬到楼顶。
// 1.  1 阶 + 1 阶 + 1 阶
// 2.  1 阶 + 2 阶
// 3.  2 阶 + 1 阶
//

/// O(n), O(n)
class Solution1 {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1 }
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2
        if n > 2 {
            for i in 3...n {
                dp[i] = dp[i - 1] + dp[i - 2]
            }
        }
        return dp[n]
    }
}

/// O(n), O(1)
class Solution2 {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1 }
        var prev = 1
        var curr = 2
        if n > 2 {
            for _ in 3...n {
                let tempPrev = curr
                curr = prev + curr
                prev = tempPrev
            }
        }
        return curr
    }
}
