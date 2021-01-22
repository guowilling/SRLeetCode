//
// 111. 二叉树的最小深度
//
// https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/
//
// 给定一个二叉树，找出其最小深度。
// 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
//
// 说明：叶子节点是指没有子节点的节点。
//
// 示例 1：
// 输入：root = [3,9,20,null,null,15,7]
// 输出：2
//
// 示例 2：
// 输入：root = [2,null,3,null,4,null,5,null,6]
// 输出：5
//

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

/// DFS
/// O(n), O(n)
class Solution1 {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var queue: [TreeNode] = []
        var depth = 1
        queue.append(root!)
        
        while !queue.isEmpty {
            let currCount = queue.count
            for _ in 0..<currCount {
                let node = queue.removeFirst()
                if node.left == nil && node.right == nil {
                    return depth
                }
                if let node = node.left {
                    queue.append(node)
                }
                if let node = node.right {
                    queue.append(node)
                }
            }
            depth += 1
        }
        
        return depth
    }
}

/// BFS
/// O(N), O(H)
class Solution2 {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if root!.left == nil && root!.right == nil {
            return 1
        }
        
        var depth = Int.max
        
        if let node = root?.left {
            depth = min(minDepth(node), depth)
        }
        if let node = root?.right {
            depth = min(minDepth(node), depth)
        }
        
        return depth + 1
    }
}
