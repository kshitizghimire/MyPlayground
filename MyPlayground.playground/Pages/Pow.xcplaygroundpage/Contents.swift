
import Foundation

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var result: Double = 1

        if n == 0 { return result }

        for _ in 1...abs(n) {
            if n < 0 {
                result = result * 1 / x
            } else {
                result = result * x
            }
        }
        return result
    }

}

pow(3, 20000000000)
Solution().myPow( 0.1, 10000)
