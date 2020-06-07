//
// 144. 二叉树的前序遍历
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

class Solution2 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
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
