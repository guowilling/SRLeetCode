//
// 145. 二叉树的后序遍历
//
// https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
//
// 给定一个二叉树，返回它的 后序 遍历。
//
// 示例:
// 输入: [1,null,2,3]
//   1
//    \
//     2
//    /
//   3
//
// 输出: [3,2,1]
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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result: [Int] = []
        result += postorderTraversal(root.left)
        result += postorderTraversal(root.right)
        result.append(root.val)
        return result
    }
}

/// 迭代方式
/// O(n), O(n)
class Solution2 {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        var result: [Int] = []
        var stack: [TreeNode] = []
        var curr = root
        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr!)
                curr = curr?.left
            }
            let temp = stack.last!
            if temp.right == nil {
                stack.removeLast()
                result.append(temp.val)
            } else {
                curr = temp.right
                temp.right = nil
            }
        }
        return result
    }
}
