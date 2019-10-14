import Foundation
import UIKit

let thumpsUp = "👍"
var str = "Hello"
str += thumpsUp

let attributedString = NSMutableAttributedString(string: str)
let testRange = NSRange(location: 5, length: thumpsUp.utf16.count)

str.utf16.count
(str as NSString).length
attributedString.addAttributes([NSAttributedString.Key.backgroundColor: UIColor.white], range: testRange)
print(attributedString)
