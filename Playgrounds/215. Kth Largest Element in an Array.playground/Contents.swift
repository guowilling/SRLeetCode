//
// 215. 数组中的第K个最大元素
//
// https://leetcode-cn.com/problems/kth-largest-element-in-an-array/
//
// 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
//
// 示例 1:
// 输入: [3,2,1,5,6,4] 和 k = 2
// 输出: 5
//
// 示例 2:
// 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
// 输出: 4
//
// 说明:
// 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
//
// 要点: 暂时用系统提供的排序函数完成此题, 但通过建堆的方式, 可以优化时间复杂度和空间复杂度
//

/// O(nlogn), O(n)
class Solution1 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // 原地排序 sort(by:) 要比赋值排序 sorted(by:) 效率更高
//        return nums.sorted(by: >)[k - 1]
        var numsM = nums
        numsM.sort(by: >)
        return numsM[k - 1]
    }
}

let s = Solution1()
s.findKthLargest([3, 2, 1, 5, 6, 4], 2)
s.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4)

/// O(n), O(logn)
class Solution2 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        return findKth(nums, k, left: 0, right: nums.count - 1)
    }
    
    func findKth(_ nums: [Int], _ k: Int, left: Int, right: Int) -> Int {
        var numsM = nums
        let position = partion(&numsM, from: left, to: right)
        if position == k - 1 {
            return numsM[position]
        } else if position < k - 1 {
            return findKth(numsM, k, left: position + 1, right: right)
        } else {
            return findKth(numsM, k, left: left, right: position - 1)
        }
    }
    
    func partion(_ nums: inout [Int], from: Int, to: Int) -> Int {
        guard from <= to, to < nums.count else {
            return -1
        }
        let pivot = nums[from]
        var left = from
        var right = to
        while left < right {
            while left < right, nums[right] <= pivot { right -= 1 }
            nums[left] = nums[right]
            
            while left < right, nums[left] >= pivot { left += 1 }
            nums[right] = nums[left]
        }
        nums[left] = pivot
        return left
    }
}

/// O(n), O(n)
class Solution3 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var numsM = nums
        var low = 0, high = numsM.count - 1
        let target = numsM.count - k
        while true {
            let index = partitionHelper(&numsM, low, high)
            if index == target {
                return numsM[index]
            } else if index < target {
                low = index + 1
            } else {
                high = index - 1
            }
        }
    }
    
    private func partitionHelper(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int {
        let random = Int.random(in: low...high)
        nums.swapAt(random, high)
        let pivot = nums[high]
        var i = low
        for j in low..<high {
            if nums[j] < pivot {
                nums.swapAt(i, j)
                i += 1
            }
        }
        nums.swapAt(i, high)
        return i
    }
}

/// O(nlogn), O(logn)
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = nums
        buildMaxHeap(&heap)
        var max = 0
        for _ in 0..<k {
            max = heap[0]
            if heap.count > 1 {
                heap[0] = heap.removeLast()
                maxHeapify(&heap, from: 0, by: >)
            }
        }
        return max
    }
    
    func buildMaxHeap(_ heap: inout [Int]) {
        for i in (0...(heap.count / 2)).reversed() {
            maxHeapify(&heap, from: i, by: >)
        }
    }

    func maxHeapify(_ heap: inout [Int], from index: Int, by method: (Int, Int) -> Bool) {
        let leftChild = index * 2 + 1, rightChild = leftChild + 1
        var largestIndex = index
        if leftChild < heap.count && method(heap[leftChild], heap[largestIndex]) {
            largestIndex = leftChild
        }
        if rightChild < heap.count && method(heap[rightChild], heap[largestIndex]) {
            largestIndex = rightChild
        }
        if largestIndex != index {
            heap.swapAt(index, largestIndex)
            maxHeapify(&heap, from: largestIndex, by: >)
        }
    }
}
