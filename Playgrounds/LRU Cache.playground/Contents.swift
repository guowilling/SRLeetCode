//
// 146. LRU缓存机制
//

class DLinkNode {
    var key: Int
    var value: Int
    var prev: DLinkNode?
    var next: DLinkNode?
    
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {

    var capacity: Int
    var cache: [Int: DLinkNode]
    var size: Int
    
    var head: DLinkNode
    var tail: DLinkNode
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = [Int: DLinkNode]()
        self.size = 0
        head = DLinkNode(0, 0)
        tail = DLinkNode(0, 0)
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            moveToHead(node)
            return node.value
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.value = value
            moveToHead(node)
        } else {
            let newNode = DLinkNode(key, value)
            cache[key] = newNode
            addToHead(newNode)
            size += 1
            if size > capacity {
                let last = removeTail()
                cache[last.key] = nil
                size -= 1
            }
        }
    }
    
    func addToHead(_ node: DLinkNode) {
        node.prev = head
        node.next = head.next
        head.next?.prev = node
        head.next = node
    }
    
    func removeNode(_ node: DLinkNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    func removeTail() -> DLinkNode {
        let node = tail.prev
        removeNode(node!)
        return node!
    }
    
    func moveToHead(_ node: DLinkNode) {
        removeNode(node)
        addToHead(node)
    }
}
