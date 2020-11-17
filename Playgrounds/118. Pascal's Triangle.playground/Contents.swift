//
// 118. 杨辉三角
//
// https://leetcode-cn.com/problems/pascals-triangle/
//
// 给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。
// 在杨辉三角中，每个数是它左上方和右上方的数的和。
//
// 示例:
// 输入: 5
// 输出:
// [
//      [1],
//     [1,1],
//    [1,2,1],
//   [1,3,3,1],
//  [1,4,6,4,1]
// ]
//

/// O(n²), O(n²)
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 0 { return [] }
        
        var triangle: [[Int]] = []
        triangle.append([1])
        
        for rowIndex in 1..<numRows {
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
