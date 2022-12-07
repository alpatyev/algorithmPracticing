import CoreGraphics

// MARK: - Cavity map

func cavityMap(grid: [String]) -> [String] {
    let size = grid[0].count
    var outputGrid: [String] = grid
    var matrix = [[Int]]()
    
    guard grid.count > 2 else {
        return grid
    }
    
    outputGrid.forEach { matrix.append($0.compactMap { integer in Int(String(integer)) ?? 1 }) }
    
    for rIndex in 1..<size - 1 {
        var row: [Character] = Array(outputGrid[rIndex])
        
        for cIndex in 1..<size - 1 {
            let up = matrix[rIndex - 1][cIndex]
            let lhs = matrix[rIndex][cIndex - 1]
            let number = matrix[rIndex][cIndex]
            let rhs = matrix[rIndex][cIndex + 1]
            let down = matrix[rIndex + 1][cIndex]


            if (number > lhs) && (number > rhs) {
                if (number > up) && (number > down) {
                    row[cIndex] = "X"
                    outputGrid[rIndex] = String(row)
                }
            }
        }
    }
    return outputGrid
}

// MARK: - Palindrome index

func palindromeIndex(s: String) -> Int {
    var str: [Character] = Array(s)
    var forwardHalf = String()
    var backwardHalf = String()
    var output = 0
    var forwardIndex: Int = 0
    var backwardIndex: Int {
        str.count - 1 - forwardIndex
    }
    
    main: for index in 0...s.count {
        for _ in 0...str.count / 2 - 1 {
            forwardHalf.append(str[forwardIndex])
            backwardHalf.append(str[backwardIndex])
            forwardIndex += 1
        }

        if (forwardHalf == backwardHalf) && !forwardHalf.isEmpty {
            output = index - 1
            break main
        }
        
        str = Array(s)
        forwardIndex = 0
        forwardHalf.removeAll()
        backwardHalf.removeAll()
        str.remove(at: index)
    }
    return output
}

func ppalindromeIndex(s: String) -> Int {
    var line = ArraySlice<Character>(s)
    var palindrome: Bool {
        let lhs = line.count % 2 == 0 ? line.count / 2 - 1: line.count / 2
        let rhs = line.count / 2
        return line[0...lhs] == ArraySlice(line[rhs..<line.count].reversed()) ? true: false
    }
    var isPalindrome: (ArraySlice<Character>) -> Bool = { str in
        let lhs = str.count % 2 == 0 ? str.count / 2 - 1: str.count / 2
        let rhs = str.count / 2
        return str[0...lhs] == ArraySlice(str[rhs..<str.count].reversed()) ? true: false
    }
    if palindrome {
        print("already palindrome: exit with -1")
        return -1
    } else {
        for index in 0..<line.count {
            let sliced = line[0..<0 + index] + line[index + 1..<line.count]
            print(sliced)
            print(isPalindrome(sliced))
        }
    }
    return -1
}
print(ppalindromeIndex(s: "133"))
