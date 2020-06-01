import UIKit

// 155. 最小栈
// 时间复杂度：O(1)
// 空间复杂度：O(N)

class MinStack {

    private var _innerArray: [Int]
    private var _helperArray: [Int]
    
    /** initialize your data structure here. */
    init() {
        _innerArray = []
        _helperArray = []
    }
    
    func push(_ x: Int) {
        _innerArray.append(x)
        if _helperArray.isEmpty || x <= _helperArray.last! {
            _helperArray.append(x)
        } else {
            if let last = _helperArray.last {
                _helperArray.append(last)
            }
        }
    }
    
    func pop() {
        if _innerArray.popLast() != nil {
            _helperArray.popLast()
        }
    }
    
    func top() -> Int {
        if let last = _innerArray.last {
            return last
        }
        return -1
    }
    
    func getMin() -> Int {
        if let min = _helperArray.last {
            return min
        }
        return -1
    }
}

let obj = MinStack()
obj.push(-2)
obj.push(0)
obj.push(-3)
obj.getMin()
obj.pop()
let ret_3: Int = obj.top()
let ret_4: Int = obj.getMin()
