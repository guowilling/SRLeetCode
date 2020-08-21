//
// 144. 二叉树的前序遍历
//
// https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
//
// 给定一个二叉树，返回它的 前序 遍历。
//
// 示例:
// 输入: [1,null,2,3]
//   1
//    \
//     2
//    /
//   3
//
// 输出: [1,2,3]
//
// 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
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

/// 递归方式
/// O(n), O(logn)
class Solution1 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result: [Int] = []
        result.append(root.val)
        result += preorderTraversal(root.left)
        result += preorderTraversal(root.right)
        return result
    }
}

/// 迭代方式
/// O(n), O(n)
class Solution2 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result: [Int] = []
        var stack: [TreeNode] = [root]
        while let node = stack.popLast() {
            result.append(node.val)
            if let right = node.right { stack.append(right) }
            if let left = node.left { stack.append(left) }
        }
        return result
    }
}
