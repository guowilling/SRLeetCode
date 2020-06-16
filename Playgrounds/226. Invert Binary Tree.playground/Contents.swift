//
// 226. 翻转二叉树
//
// https://leetcode-cn.com/problems/invert-binary-tree/
//
// 翻转一棵二叉树。
// 示例：
// 输入：
//           4
//         /   \
//        2     7
//       / \   / \
//      1   3 6   9
//
// 输出：
//           4
//         /   \
//        7     2
//       / \   / \
//      9   6 3   1
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

/// O(n), O(n)
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        
        root.left = right
        root.right = left
        
        return root
    }
}
