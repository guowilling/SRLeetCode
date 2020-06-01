import UIKit

// 150. 逆波兰表达式求值
// 要点: 操作数压栈, 操作符出栈.

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        enum Operator: String {
            case add = "+"
            case sub = "-"
            case mul = "*"
            case div = "/"
            
            func exec(left: Int, right: Int) -> Int {
                switch self {
                case .add:
                    return left + right
                case .sub:
                    return left - right
                case .mul:
                    return left * right
                case .div:
                    return left / right
                }
            }
        }
        
        var stack: [Int] = []
        
        for token in tokens {
            if let op = Operator(rawValue: token) {
                guard let right = stack.popLast(), let left = stack.popLast() else { break }
                stack.append(op.exec(left: left, right: right))
            } else {
                if let num = Int(token) {
                    stack.append(num)
                }
            }
        }
        
        return stack.first!
    }
}

let s = Solution()
s.evalRPN(["2", "1", "+", "3", "*"]) == 9
s.evalRPN(["4", "13", "5", "/", "+"]) == 6
s.evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]) == 22
