import UIKit

// 118. 杨辉三角

// 链接: https://leetcode-cn.com/problems/pascals-triangle/
// 要点：根据杨辉三角规律迭代生成
// 时间复杂度：O(n^2)
// 空间复杂度：O(n^2)

class Solution {
    func generate(_ nowRows: Int) -> [[Int]] {
        var triangle: [[Int]] = []
        triangle.append([1])
        
        for rowIndex in 1..<nowRows {
            var row: [Int] = []
            let preRow = triangle[rowIndex - 1]
            row.append(1)
            for index in 1..<rowIndex {
                row.append(preRow[index - 1] + preRow[index])
            }
            row.append(1)
            triangle.append(row)
        }
        return triangle
    }
}

let s = Solution()
let input = 5
let expectation = [
    [1],
    [1, 1],
    [1, 2, 1],
    [1, 3, 3, 1],
    [1, 4, 6, 4, 1]
]
assert(s.generate(input) == expectation)
