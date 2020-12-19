//
// 155. 最小栈
//
// https://leetcode-cn.com/problems/min-stack/
//
// 设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。
//
// push(x) —— 将元素 x 推入栈中。
// pop() —— 删除栈顶的元素。
// top() —— 获取栈顶元素。
// getMin() —— 检索栈中的最小元素。
//
// 示例:
// 输入：
// ["MinStack","push","push","push","getMin","pop","top","getMin"]
// [[],[-2],[0],[-3],[],[],[],[]]
//
// 输出：
// [null,null,null,null,-3,null,0,-2]
//
// 解释：
// MinStack minStack = new MinStack();
// minStack.push(-2);
// minStack.push(0);
// minStack.push(-3);
// minStack.getMin();   --> 返回 -3.
// minStack.pop();
// minStack.top();      --> 返回 0.
// minStack.getMin();   --> 返回 -2.
//

class MinStack {

    var stack: [Int]
    var minStack: [Int]

    /** initialize your data structure here. */
    init() {
        stack = []
        minStack = []
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if minStack.last == nil || x < minStack.last! {
            minStack.append(x)
        } else {
            minStack.append(minStack.last!)
        }
    }
    
    func pop() {
        stack.popLast()
        minStack.popLast()
    }
    
    func top() -> Int {
        if let last = stack.last {
            return last
        }
        return -1
    }
    
    func getMin() -> Int {
        if let min = minStack.last {
            return min
        }
        return -1
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

let obj = MinStack()
obj.push(-2)
obj.push(0)
obj.push(-3)
obj.getMin()
obj.pop()
let ret_3: Int = obj.top()
let ret_4: Int = obj.getMin()
