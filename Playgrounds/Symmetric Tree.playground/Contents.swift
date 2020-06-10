//
// 101. 对称二叉树
//
// 时间复杂度: O(n)
// 空间复杂度: O(n)

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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }
    
    func isMirror(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil { return true }
        if let node1 = node1, let node2 = node2 {
            return (node1.val == node2.val) && isMirror(node1.right, node2.left) && isMirror(node1.left, node2.right)
        } else {
            return false
        }
    }
}

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
            
            if let left = node1.left {
                if let right = node2.right {
                    queue.append(left)
                    queue.append(right)
                } else {
                    return false
                }
            } else {
                if let _ = node2.right {
                    return false
                }
            }
            
            if let right = node1.right {
                if let left = node2.left {
                    queue.append(right)
                    queue.append(left)
                } else {
                    return false
                }
            } else {
                if let _ = node2.left {
                    return false
                }
            }
        }
        
        return true
    }
}
