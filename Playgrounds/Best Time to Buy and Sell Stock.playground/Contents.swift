//
// 121. 买卖股票的最佳时机
//

/// 时间复杂度: O(n²)
class Solution1 {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit: Int = 0
        for (i, price) in prices.enumerated() {
            for j in (i + 1)..<prices.count {
                let profit = prices[j] - price
                if profit > maxProfit {
                    maxProfit = profit
                }
            }
        }
        return maxProfit
    }
}

/// 时间复杂度: O(n)
class Solution2 {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0
        for i in 0..<prices.count {
            let price = prices[i]
            if price < minPrice {
                minPrice = price
            } else {
                let profit = price - minPrice
                maxProfit = max(maxProfit, profit)
            }
        }
        return maxProfit
    }
}
