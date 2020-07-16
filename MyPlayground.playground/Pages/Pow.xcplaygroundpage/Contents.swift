
import Foundation

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var n = n
        var x = x
        if n == 0 {
            return 1
        }
        if n < 0 {
            n = -n
            x = 1 / x
        }
        return (n % 2 == 0) ? myPow(x * x, n / 2) : x * myPow(x * x, n / 2)
    }
}

pow(3, 20000000000)
Solution().myPow( 0.1, 10000)
