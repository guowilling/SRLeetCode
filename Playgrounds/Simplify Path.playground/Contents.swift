//
// 71. 简化路径
// 时间复杂度: O(N)
// 空间复杂度: O(N)
//

class Solution {
    func simplifyPath(_ path: String) -> String {
        let paths = path.split(separator: "/")
        var pathStack: [String] = []
        for path in paths {
            guard path != ".", !path.isEmpty else { continue }
            if path == ".." {
                pathStack.popLast()
            } else {
                pathStack.append(String(path))
            }
        }
        return "/" + pathStack.joined(separator: "/")
    }
}

let s = Solution()
s.simplifyPath("/home/") == "/home"
s.simplifyPath("/../") == "/"
s.simplifyPath("/home//foo/") == "/home/foo"
s.simplifyPath("/a/./b/../../c/") == "/c"
s.simplifyPath("/a/../../b/../c//.//") == "/c"
s.simplifyPath("/a//b////c/d//././/..") == "/a/b/c"
