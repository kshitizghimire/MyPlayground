//: [Previous](@previous)

import Foundation

func ClosestXdestinations(numDestinations:Int, allLocations:[[Int]],
                          numDeliveries:Int) -> [[Int]]
{
    // WRITE YOUR CODE HERE
    var distanceDictionary = [Double: [Int]]()
    
    for location in allLocations {
        let x = location.first!
        let y = location.last!
        let distanceFromStart = sqrt(Double(x*x + y*y))
        distanceDictionary[distanceFromStart] = location
    }
    
    let keys = distanceDictionary.keys.sorted { $0 < $1 }
    
        var returnArray = [[Int]]()
        
    for i in 0 ..< numDeliveries {
        let key = keys[i]
        returnArray.append(distanceDictionary[key]!)
        
    }
    
    return returnArray
}
