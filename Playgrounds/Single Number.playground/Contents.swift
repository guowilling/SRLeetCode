//
// 136. 只出现一次的数字
//

/// 时间复杂度: O(n²)
/// 空间复杂度: O(1)
class Solution1 {
    func singleNumber(_ nums: [Int]) -> Int {
        for (i, curr) in nums.enumerated() {
            var isSingle = true
            for (j, num) in nums.enumerated() {
                if i != j && curr == num {
                    isSingle = false
                    break
                }
            }
            if isSingle {
                return curr
            }
        }
        return -1
    }
}

/// 时间复杂度: O(n)
/// 空间复杂度: O(n)
class Solution2 {
    func singleNumber(_ nums: [Int]) {
        var dict: [Int: Int] = [:]
        for num in nums {
            if var count = dict[num] {
                count += 1
                dict[num] = count
            } else {
                dict[num] = 1
            }
        }
        for (key, value) in dict {
            if value == 1 { return key }
        }
        return -1
    }
}

/// 时间复杂度: O(n)
/// 空间复杂度: O(1)
class Solution3 {
    func singleNumber(_ nums: [Int]) {
//        var single = 0
//        for num in nums {
//            single ^= num
//        }
//        return single
        return nums.reduce(0, ^)
    }
}
