import Foundation

class Solution {
    struct Cell: Hashable {
        var row: Int
        var col: Int
    }
    var paths = [[Cell]]()
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        for i in 0..<grid.count {
            for j in 0..<grid[i].count{
                if grid[i][j] == 1 {
                    dfs(grid, i, j, Set<Cell>())
                }
            }
        }
        
        return paths.count
    }
    
    func dfs(_ grid: [[Int]], _ i: Int, _ j: Int,_ currentPath: Set<Cell>) {
        guard i >= 0 && i < grid.count && j >= 0 && j < grid[i].count && currentPath.contains(Cell(row: i, col: j)) == false && grid[i][j] != -1 else {
            return
        }
        if grid[i][j] == 2 {
            paths.append(Array(currentPath))
        }
        var currentPath = currentPath
        currentPath.insert(Cell(row: i, col: j))
        dfs(grid,i + 1, j, currentPath)
        dfs(grid,i - 1, j, currentPath)
        dfs(grid,i, j + 1, currentPath)
        dfs(grid,i, j - 1, currentPath)
        
    }
}

Solution().uniquePathsIII([[1,0,0,0],
                           [0,0,0,0],
                           [0,0,2,-1]])

