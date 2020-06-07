//
// 145. 二叉树的后序遍历
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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result: [Int] = []
        result += postorderTraversal(root.left)
        result += postorderTraversal(root.right)
        result.append(root.val)
        return result
    }
}

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
