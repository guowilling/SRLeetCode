/// Bubble Sort
func bubbleSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count > 2 else { return }
    for end in (1..<array.count).reversed() {
        var swapped = false
        for i in (1...end).reversed() {
            if array[i] < array[i - 1] {
                array.swapAt(i, i - 1)
                swapped = true
            }
        }
        if !swapped { return }
    }
}

/// Selection Sort
func selectionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count > 2 else { return }
    for curr in 0..<array.count {
        var min = curr
        for i in curr..<array.count {
            if array[i] < array[min] {
                min = i
            }
        }
        if min != curr {
            array.swapAt(min, curr)
        }
    }
}


/// Insertion Sort
func insertionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count > 2 else { return }
    for curr in 1..<array.count {
        for i in (1...curr).reversed() {
            if array[i] < array[i - 1] {
                array.swapAt(i, i - 1)
            } else {
                break
            }
        }
    }
}

/// Quick Sort
func quicksort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count / 2]
    let left = array.filter { $0 < pivot }
    let middle = array.filter { $0 == pivot }
    let right = array.filter { $0 > pivot }
    
    return quicksort(left) + middle + quicksort(right)
}

var testArray = [15, 5, 35, 25, 45]
let sortedArray = [5, 15, 25, 35, 45]

//bubbleSort(&testArray)
//selectionSort(&testArray)
//insertionSort(&testArray)
//assert(testArray == sortedArray)

let resultArray = quicksort(testArray)
assert(resultArray == sortedArray)
