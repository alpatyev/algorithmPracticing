
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

