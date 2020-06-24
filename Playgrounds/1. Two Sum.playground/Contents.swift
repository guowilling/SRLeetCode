//
// 1.两数之和
//
// https://leetcode-cn.com/problems/two-sum/
//
// 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
//
// 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
//

/// O(n), O(n)
/// - 题解: 顺序遍历数组, 利用哈希表(字典)查找元素时间复杂度O(1)的特性,
///        以元素值为 Key, 元素索引为 Value 暂存, 暂存哈希表中若存在 target - num 的键值对, 即命中返回.
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var addedDict = [Int: Int]()
        for (index, num) in nums.enumerated() {
            if let lastIndex = addedDict[target - num] {
                return [lastIndex, index]
            }
            addedDict[num] = index
        }
        return []
    }
}

let s = Solution()
assert(s.twoSum([2, 7, 11, 15], 9) == [0, 1])
