
import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle == "" { return 0 }
        if needle.count > haystack.count { return -1 }
        let hayStackArray:[String] = Array(haystack).map {"\($0)"}
        let width = needle.count
        var mappings = [String: Int]()
        var index = 0
        for _ in hayStackArray {
            let key = Array(hayStackArray[index..<(index+width)]).joined()
            if mappings[key] == nil {
                mappings[key] = index
            }
            if key == hayStackArray.suffix(width).joined() {
                break
            }
            index += 1
            
        }
        if let index = mappings[needle] {
            return index
        }
        
        return -1
    }
}

Solution().strStr("aaaaaaaaa","aaaa")
