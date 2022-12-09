import CoreFoundation

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

func slowPalindromeIndex(s: String) -> Int {
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

func otherSlowPalindromeIndex(s: String) -> Int {
    let line = ArraySlice<Character>(s)
    let isPalindrome: (ArraySlice<Character>) -> Bool = { str in
        let lhs = str.count % 2 == 0 ? str.count / 2 - 1: str.count / 2
        let rhs = str.count / 2
        return str[0...lhs] == ArraySlice(str[rhs..<str.count].reversed()) ? true: false
    }
    
    if isPalindrome(line) {
        return -1
    } else {
        for index in 0..<line.count {
            if isPalindrome(line[0..<0 + index] + line[index + 1..<line.count]) {
                return index
            }
        }
    }
    return -1
}

func nextSlowPalindromeIndex(s: String) -> Int {
    var tempString: [Character] = Array(s)
    var isPalindrome: Bool {
        tempString == tempString.reversed() ? true: false
    }

    if isPalindrome {
        return -1
    } else {
        for index in 0..<s.count {
            tempString = Array(s)
            tempString.remove(at: index)
            if isPalindrome {
                return index
            }
        }
    }
    return -1
}


// MARK: - Priyanka and toys

func toys(w: [Int]) -> Int {
    let sorted: [Int] = w.sorted(by: { $0 < $1 })
    var count = 1
    var max = sorted[0] + 4
    
    for weight in sorted {
        if weight > max {
            count += 1
            max = weight + 4
        }
    }
    return count
}

// MARK: - Manasa and stones

func stones(n: Int, a: Int, b: Int) -> [Int] {
    var result = [Int]()
    
    if a == b {
        result.append(a * (n - 1))
    } else {
        let (x, y) = a > b ? (b, a): (a, b)
        
        for i in 0..<n {
            result.append(x * ((n - 1) - i ) + (y * i))
        }

    }
    return result
}

