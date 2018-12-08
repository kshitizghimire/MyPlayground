//: [Previous](@previous)

import Foundation

let travellingCars = [0, 1, 0, 1, 1]


func passingCars(cars: [Int]) {
    var passingCount = 0
    var noOfZeros = 0
    for (index, value) in cars.enumerated() {
        if value == 1 {
            passingCount += 1
        } else if value == 0 {
            noOfZeros = index
        }
    
    }
    print(passingCount)
}


passingCars(cars: travellingCars)
