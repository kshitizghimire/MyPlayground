import Foundation



class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty {
            return 0
        }
        var grid = grid
        var islandCount = 0
        for i in 0 ..< grid.count {
            for j in 0 ..< grid.first!.count {
                if grid[i][j] == "1" {
                    islandCount += 1
                    convertIslandToWater(&grid,i , j)
                }
            }
        }
        
        
        return islandCount
    }
    
    private func convertIslandToWater( _ grid: inout [[Character]], _ i: Int, _ j: Int) {
        
        if i < 0 || i >= grid.count || j < 0 || j >= grid.first!.count || grid[i][j] == "0" {
            return
        }
        grid[i][j] = "0"
        convertIslandToWater(&grid,i - 1, j)
        convertIslandToWater(&grid,i + 1, j)
        convertIslandToWater(&grid,i, j + 1)
        convertIslandToWater(&grid,i, j - 1)
        
    }
}


Solution.init().numIslands([["1"],["1"]])
