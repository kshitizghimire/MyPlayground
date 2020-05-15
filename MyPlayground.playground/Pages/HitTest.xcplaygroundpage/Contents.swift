
import Foundation

class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        var i = 0
        while i < arr.count {
            if arr[i] == 0 {
               i += 1
                arr.insert(0, at: i)
            }
            
            i += 1
        }
        
    }
}
