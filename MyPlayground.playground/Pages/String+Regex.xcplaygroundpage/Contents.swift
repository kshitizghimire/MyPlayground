
import Foundation
import UIKit
import PlaygroundSupport

extension String {
    func ranges(of pattern: String) -> [NSRange] {
        let regularExpression = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let matches = regularExpression?.matches(in: self, options: [], range: NSRange(string.startIndex..., in:self))
        return matches?.compactMap { textCheckResult -> NSRange in
            textCheckResult.range
            } ?? []
    }
}

let string = "Don‘t fuck👩‍👩‍👧‍👧🖕 and some text‘a fuck!@#$%^&*()_+<>,.?/\\`ABC093456?<>?~-="
let attributedString = NSMutableAttributedString(string: string)
func addAttribute(for ranges: [NSRange]) {
    ranges.forEach { range in
        attributedString.addAttributes([NSAttributedString.Key.backgroundColor : UIColor.red], range: range)
    }
}

let a = string.ranges(of: "[^a-zA-Z0-9 ]")
let b = string.ranges(of: "\\bfuck\\b")


addAttribute(for: a )
addAttribute(for: b )


class ViewController: UIViewController {

    override func viewDidLoad() {
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = attributedString
        label.backgroundColor = .white
        view = label
    }
}

let vc = ViewController()
PlaygroundPage.current.liveView = vc

