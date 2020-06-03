import UIKit

// 622. 设计循环队列

class MyCircularQueue {

    private var items: [Int]
    
    private let capacity: Int
    
    private var head = -1
    private var tail = -1
    
    private var size : Int = 0
    
    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        self.capacity = k
        self.items = [Int](repeating: 0, count: capacity)
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }
        
        tail = (tail + 1) % capacity
        items[tail] = value
        
        if size == 0 {
            head = tail
        }
        
        size += 1
        
        return true
    }
    
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        if isEmpty() { return false }
        
        head = (head + 1) % capacity
        
        size -= 1
        
        return true
    }
    
    /** Get the front item from the queue. */
    func Front() -> Int {
        return isEmpty() ? -1 : items[head]
    }
    
    /** Get the last item from the queue. */
    func Rear() -> Int {
        return isEmpty() ? -1 : items[tail]
    }
    
    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        return size == 0
    }
    
    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        return size == capacity
    }
}
