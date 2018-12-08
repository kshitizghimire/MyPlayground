
import Foundation

func twoSum(array: [Int], target: Int) -> [Int] {

    var dict = [Int: Int]()
    for (index, val) in array.enumerated() {
        let complement = target - val
        if let complementIndex = dict[complement] {
            return [index, complementIndex]
        }
        dict[val] = index
    }
    return []
}

let array = [111,12,13,4,5,6,7,18]

let target = 10
print(array)

let result = twoSum(array: array, target: target)
print(result)


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numsDictionary: [Int:Int] = [:]
        for (index, value) in nums.enumerated() {
            numsDictionary[value] = index
        }
        for (index, value) in nums.enumerated() {
            let complement = target - value
            if let complementIndex = numsDictionary[complement], index != complementIndex {
                return [index, complementIndex]
            }
        }
        
        return []
    }
}

let output = Solution().twoSum([3,2,4], 6)
