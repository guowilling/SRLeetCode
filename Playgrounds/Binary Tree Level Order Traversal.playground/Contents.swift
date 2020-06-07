//
// 102. 二叉树的层序遍历
//
// 链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
// 时间复杂度： O(N)
// 空间复杂度： O(N)

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
