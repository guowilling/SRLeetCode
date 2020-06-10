//
// 104. 二叉树的最大深度
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
class Solution1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let leftDepth = maxDepth(root.left)
        let rightDepth = maxDepth(root.right)
        return max(leftDepth, rightDepth) + 1
    }
}

/// DFS 迭代方式, 使用栈
class Solution2 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var stack: [(TreeNode, Int)] = []
        stack.append((root, 1))
        
        var maxLevel = -1
        
        while !stack.isEmpty {
            let last = stack.removeLast()
            let level = last.1
            if let left = last.0.left {
                stack.append((left, level + 1))
            }
            if let right = last.0.right {
                stack.append((right, level + 1))
            }
            maxLevel = max(maxLevel, level)
        }
        
        return maxLevel
    }
}

/// BFS 迭代方式, 使用队列
class Solution3 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var queue: [TreeNode] = []
        queue.append(root)
        
        var level = 0
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let first = queue.removeFirst()
                if let left = first.left {
                    queue.append(left)
                }
                if let right = first.right {
                    queue.append(right)
                }
            }
            level += 1
        }
        
        return level
    }
}
