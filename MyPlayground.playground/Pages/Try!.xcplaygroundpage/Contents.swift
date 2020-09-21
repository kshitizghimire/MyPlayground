import Foundation




let string = "string"
let arr = Array(string)
let str = String(arr[0...2])


class Solution {
    var paths = [[Int]]()
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        
        for i in 0..<grid.count {
            for j in 0<grid[i].count{
                if grid[i][j] == 1 {
                    dfs(grid, i, j)
                }
            }
        }
        
        return paths.count
    }
    
    func dfs(_ grid: [[Int]], _ i: Int, _ j: Int, visited: Set<Array<Int>>) {
        guard i>= 0 && i<grid.count && j>=0 && j<grid[i].count && visited.contains(grid[i][j]) == false else {
            return
        }
        
    }
}

[[1,0,0,0],
 [0,0,0,0],
 [0,0,2,-1]]

