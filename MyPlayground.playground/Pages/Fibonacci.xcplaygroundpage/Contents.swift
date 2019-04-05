import Foundation

func fibonacci(for number: UInt) -> UInt {
    if number < 2 {
        return 1
    }
    return fibonacci(for: number - 1) + fibonacci(for: number - 2)
}

func fibonacci(for number: Int, cache: inout [Int: Int]) -> Int {

    if let result = cache[number] {
        return result
    }
    cache[number] = fibonacci(for: number - 1, cache: &cache) + fibonacci(for: number - 2, cache: &cache)
    return cache[number]!
}

var cache = [0: 1, 1: 1]
let startTimeForCache = CFAbsoluteTimeGetCurrent()
print(fibonacci(for: 30, cache: &cache))
let timeElapsedForCache = CFAbsoluteTimeGetCurrent() - startTimeForCache
print(timeElapsedForCache)


let startTime = CFAbsoluteTimeGetCurrent()
print(fibonacci(for: 100))
let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
print(timeElapsed)
