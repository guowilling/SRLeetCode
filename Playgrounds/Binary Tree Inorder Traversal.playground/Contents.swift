//
// 94. 二叉树的中序遍历
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

class Solution1 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result: [Int] = []
        
        func _helper(_ node: TreeNode, res: inout [Int]) {
            if let left = node.left {
                _helper(left, res: &res)
            }
            res.append(node.val)
            if let right = node.right {
                _helper(right, res: &res)
            }
        }
        
        _helper(root, res: &result)
        
        return result
    }
}

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
