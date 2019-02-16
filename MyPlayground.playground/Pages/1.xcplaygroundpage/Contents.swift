//: [Previous](@previous)

import Foundation
struct Queue<T> {
    private var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    var front: T? {
        return array.first
    }
}

func removeObstacle(numRows:Int, numColumns:Int, lot:[[Int]]) -> Int
{
    // WRITE YOUR CODE HERE
    var destination = [Int]()
    var visited = [[Int]]()
    for i in 0 ..< lot.count {
        for j in 0 ..< lot.first!.count {
            visited[i][j] = 0
            if lot[i][j] == 9 {
                destination.append(i)
                destination.append(j)
            }
        }
    }
    
    let rowNum = [-1,0,0,1]
    let colNum = [0, -1,-1,0]
    
    var resultPathArray = [[Int]]()
    
    let source = [0, 0]
    visited[0][0] = 1
    
    var queue = Queue<[Int]>()
    queue.enqueue(source)
    
    
    while !queue.isEmpty {
        var pathNodeArray = [Int]()
        let currentPoint = queue.dequeue()!
        if currentPoint == destination {
            resultPathArray
        }
        
       
        for i in 0..<4 {
            let row = currentPoint.first! + rowNum[i]
            let col = currentPoint.last! + colNum[i]
            
            if row > 0 && row <  lot.count && col > 0 && col < lot.first!.count && visited[row][col] == 0 {
                visited[row][col] = 1
                let node = lot[row][col]
                queue.enqueue([row, col])
                pathNodeArray.append(node)
            }
            
        }
        resultPathArray.append(pathNodeArray)
    }
    
    var result: Int = Int.max
    for resultPath in resultPathArray {
        result = min(result, resultPath.count)
    }
    
    return result
}







