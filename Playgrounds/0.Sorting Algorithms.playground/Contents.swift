/// Bubble Sort
/// - Parameter array: To be sorted array
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

/// Bubble Sort
/// - Parameter array: To be sorted array
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


/// Insetion Sort
/// - Parameter array: To be sorted array
func insetionSort<Element: Comparable>(_ array: inout [Element]) {
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

var testArray = [15, 5, 35, 25, 45]
let sortedArray = [5, 15, 25, 35, 45]

//bubbleSort(&testArray)
//selectionSort(&testArray)
//insetionSort(&testArray)
assert(testArray == sortedArray)
