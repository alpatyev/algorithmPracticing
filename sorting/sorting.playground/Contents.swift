
// MARK: - Bubble sort

func bubbleSort(_ array: [Int]) -> [Int] {
    var tempArray = array
    var end = array.count - 1
    while end > 0 {
        end += 1
        for i in 1..<end {
            if tempArray[i - 1] < tempArray[i] {
                tempArray.swapAt(i - 1, i)
            }
        }
        end -= 2
    }
    return tempArray
}

