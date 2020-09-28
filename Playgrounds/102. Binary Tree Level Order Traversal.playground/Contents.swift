//
// 102. 二叉树的层序遍历
//
// https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
//
// 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
//
// 示例：
// 二叉树：[3,9,20,null,null,15,7]
//     3
//    / \
//   9  20
//  /  \
// 15   7
//
// 返回其层次遍历结果：
// [
//  [3],
//  [9,20],
//  [15,7]
// ]
//

/// Definition for a binary tree node.
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/// 递归方式
class Solution1 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var result: [[Int]] = []
        
        func _helper(_ node: TreeNode, level: Int) {
            if result.count == level {
                result.append([])
            }
            
            result[level].append(node.val)
            
            if let left = node.left {
                _helper(left, level: level + 1)
            }
            if let right = node.right {
                _helper(right, level: level + 1)
            }
        }
        
        _helper(root, level: 0)
        
        return result
    }
}

/// 迭代方式, O(n), O(n)
class Solution2 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var result: [[Int]] = []
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            var level: [Int] = []
            for _ in 0 ..< queue.count {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(level)
        }
        
        return result
    }
}
