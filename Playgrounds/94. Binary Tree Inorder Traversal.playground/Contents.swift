//
// 94. 二叉树的中序遍历
//
// https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
//
// 给定一个二叉树，返回它的 中序 遍历。
//
// 示例:
// 输入: [1,null,2,3]
//    1
//     \
//      2
//     /
//    3
//
// 输出: [1,3,2]
//
// 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
//

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/// 递归方式
/// O(n), O(logn)
class Solution1 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result: [Int] = []
        
        func _traversal(_ node: TreeNode, res: inout [Int]) {
            if let left = node.left {
                _traversal(left, res: &res)
            }
            res.append(node.val)
            if let right = node.right {
                _traversal(right, res: &res)
            }
        }
        
        _traversal(root, res: &result)
        
        return result
    }
}

/// 迭代方式
/// O(n), O(n)
class Solution2 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        var result: [Int] = []
        var stack: [TreeNode] = []
        var curr = root
        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr!)
                curr = curr?.left
            }
            curr = stack.removeLast()
            result.append(curr!.val)
            curr = curr?.right
        }
        return result
    }
}
