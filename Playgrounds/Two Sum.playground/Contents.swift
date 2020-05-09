import UIKit

// 1.两数之和
//
// 链接: https://leetcode-cn.com/problems/two-sum/
// 要点: 顺序遍历目标数组, 利用哈希表(Dictionary)查找元素时间复杂度O(1)的特性,
//      以元素值为 Key, 元素索引为 Value 暂存, 暂存字典中若存在 target - num 的键值对, 即命中返回.
// 时间复杂度(n)
// 空间复杂度(n)

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var maybeAddendDic = [Int: Int]()
        for (index, num) in nums.enumerated() {
            if let lastIndex = maybeAddendDic[target - num] {
                return [lastIndex, index]
            }
            maybeAddendDic[num] = index
        }
        return []
    }
}

let s = Solution()
assert(s.twoSum([2,7,11,15], 9) == [0, 1])
