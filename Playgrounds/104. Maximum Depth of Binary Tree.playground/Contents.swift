//
// 104. 二叉树的最大深度
//
// https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
//
// 给定一个二叉树，找出其最大深度。
// 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
// 说明: 叶子节点是指没有子节点的节点。
//
// 示例：
// 给定二叉树 [3,9,20,null,null,15,7]，
//     3
//    / \
//   9  20
//     /  \
//    15   7
// 返回它的最大深度 3。
//

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

/// DFS 递归方式
/// O(n), O(height)
class Solution1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let leftDepth = maxDepth(root.left)
        let rightDepth = maxDepth(root.right)
        return max(leftDepth, rightDepth) + 1
    }
}

/// DFS 迭代方式, 使用栈
/// O(n), O(n)
class Solution2 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var maxLevel = 0
        var stack: [(TreeNode, Int)] = []
        stack.append((root, 1))
        while !stack.isEmpty {
            let last = stack.removeLast()
            let level = last.1
            if let left = last.0.left { stack.append((left, level + 1)) }
            if let right = last.0.right { stack.append((right, level + 1)) }
            maxLevel = max(maxLevel, level)
        }
        return maxLevel
    }
}

/// BFS 迭代方式, 使用队列
/// O(n), O(n)
class Solution3 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var level = 0
        var queue: [TreeNode] = []
        queue.append(root)
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let first = queue.removeFirst()
                if let left = first.left { queue.append(left) }
                if let right = first.right { queue.append(right) }
            }
            level += 1
        }
        return level
    }
}
