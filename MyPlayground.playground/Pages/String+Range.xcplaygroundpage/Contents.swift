
import Foundation
import UIKit
import PlaygroundSupport

extension String {
    func indices(of occurrence: String) -> [Int] {
        var indices = [Int]()
        var currentIndex = self.startIndex
        while let range = self.range(of: occurrence,
                                     range: currentIndex..<self.endIndex) {
                                        let index = self.distance(from: self.startIndex,
                                                                  to: range.lowerBound)
                                        indices.append(index)
                                        let offset = occurrence.distance(from: occurrence.startIndex,
                                                                         to: occurrence.endIndex) - 1
                                        guard let afterIndex = self.index(range.lowerBound,
                                                                          offsetBy: offset,
                                                                          limitedBy: self.endIndex) else {
                                                                            break
                                        }
                                        currentIndex = self.index(after: afterIndex)
        }
        return indices
    }

    func ranges(of searchString: String) -> [Range<String.Index>] {
        let indices = self.indices(of: searchString)
        let count = searchString.count
        return indices.map {
            self.index(startIndex, offsetBy: $0)..<self.index(startIndex, offsetBy: $0 + count)
        }
    }
}

let string = "Don‘t fuck👩‍👩‍👧‍👧🖕 and some text‘a fuck"


let attributedString = NSMutableAttributedString(string: string)
func addAttribute(for ranges: [Range<String.Index>]) {

    ranges.forEach { range in
        let range = NSRange(range, in: string)
        attributedString.addAttributes([NSAttributedString.Key.backgroundColor : UIColor.yellow], range: range)
    }
}


string.indices(of: "🖕")
addAttribute(for: string.ranges(of: "🖕"))
string.indices(of: "fuck")
addAttribute(for:string.ranges(of: "fuck"))
string.indices(of: "‘")
addAttribute(for:string.ranges(of: "‘"))




class ViewController: UIViewController {

    override func viewDidLoad() {
        let label = UILabel()
        label.attributedText = attributedString
        label.backgroundColor = .white
        view = label
    }
}

let vc = ViewController()
PlaygroundPage.current.liveView = vc

