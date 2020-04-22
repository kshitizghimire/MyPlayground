//: [Previous](@previous)

import Foundation

func coins(cents: Int) -> [String: Int] {
    
    var result = [String: Int]()
    
    let first = cents.quotientAndRemainder(dividingBy: 25)
    if first.quotient > 0 {
        result["25"] = first.quotient
    }
    
    let second = first.remainder.quotientAndRemainder(dividingBy: 10)
    if second.quotient > 0 {
        result["10"] = second.quotient
    }
    let third = second.remainder.quotientAndRemainder(dividingBy: 5)
    if third.quotient > 0 {
        result["5"] = third.quotient
    }
    
    let fourth = third.remainder.quotientAndRemainder(dividingBy: 1)
     if fourth.quotient > 0 {
         result["1"] = fourth.quotient
     }
    return result
}

coins(cents: 338)
