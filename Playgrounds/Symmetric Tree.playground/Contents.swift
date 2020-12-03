//
// 101. 对称二叉树
//
// https://leetcode-cn.com/problems/symmetric-tree/
//
// 给定一个二叉树，检查它是否是镜像对称
//
//
// 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
//
//     1
//    / \
//   2   2
//  / \ / \
// 3  4 4  3
//
// 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
//
//     1
//    / \
//   2   2
//    \   \
//    3    3
//
// 进阶：
//
// 你可以运用递归和迭代两种方法解决这个问题吗？
//
// 提示：
// 如果同时满足下面的条件，两个树互为镜像：
// * 它们的两个根结点具有相同的值
// * 每个树的右子树都与另一个树的左子树镜像对称
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

/// 递归
/// O(n), O(n)
class Solution1 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }
    
    func isMirror(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if let p = p, let q = q {
            return (p.val == q.val) && isMirror(p.left, q.right) && isMirror(p.right, q.left)
        } else {
            return false
        }
    }
}

/// 迭代
/// O(n), O(n)
class Solution2 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        var queue: [TreeNode] = []
        queue.append(root)
        queue.append(root)
        
        while !queue.isEmpty {
            let node1 = queue.removeFirst()
            let node2 = queue.removeFirst()
            if node1.val != node2.val {
                return false
            }
            
            if let left = node1.left, let right = node2.right {
                queue.append(left)
                queue.append(right)
            } else if node1.left != nil || node2.right != nil {
                return false
            }
            
            if let right = node1.right, let left = node2.left {
                queue.append(right)
                queue.append(left)
            } else if node1.right != nil || node2.left != nil {
                return false
            }
        }
        
        return true
    }
}
