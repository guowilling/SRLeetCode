//
// 509. 斐波那契数
//
// https://leetcode-cn.com/problems/fibonacci-number/
//
//
// 斐波那契数，通常用 F(n) 表示，形成的序列称为斐波那契数列。
// 该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：
//  F(0) = 0,   F(1) = 1
//  F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
// 给定 N，计算 F(N)。
//

/// O(2^n), O(1)
class Solution1 {
    func fib(_ n: Int) -> Int {
        if n <= 1 { return n }
        return fib(n - 1) + fib(n - 2)
    }
}

/// O(n), O(n)
class Solution2 {
    func fib(_ n: Int) -> Int {
        var meno: [Int] = Array(repeating: 0, count: n + 1)
        return helper(meno: &meno, n: n)
    }
    
    func helper(meno: inout [Int], n: Int) -> Int {
        if n <= 1 { return n }
        if meno[n] != 0 { return meno[n] }
        return helper(meno: &meno, n: n - 1) + helper(meno: &meno, n: n - 2)
    }
}

/// O(n), O(n)
class Solution3 {
    func fib(_ n: Int) -> Int {
        if n <= 1 { return n }
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
}

/// O(n), O(1)
class Solution4 {
    func fib(_ n: Int) -> Int {
        if n <= 1 { return n }
        var prev = 0
        var curr = 1
        for _ in 2...n {
            let temp = prev + curr
            prev = curr
            curr = temp
        }
        return curr
    }
}
