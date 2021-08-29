
import UIKit

extension UIView {
    func hitTest2(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isUserInteractionEnabled && !isHidden && alpha >= 0.01 else {
            return nil
        }
        if self.point(inside: point, with: event) {
            for subview in self.subviews.reversed() {
                let convertedPoint = self.convert(point, to: subview)
                if let candidate = subview.hitTest2(convertedPoint, with: event) {
                    return candidate
                }
            }
            return self
        }
        return nil
    }
    
    func point2(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return point.x >= self.bounds.origin.x && point.x <= self.bounds.size.width
            && point.y > self.bounds.origin.y && point.y <= self.bounds.size.height
    }
}

let view = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
print(view.bounds)
let point = CGPoint(x: 10, y: 10)
let inside = view.point2(inside: point, with: nil)
print(inside)


let view1 = UIView(frame: CGRect(x: 50, y: 50, width: 128, height: 128))
let view2 = UIView(frame: CGRect(x: 200, y: 200, width: 128, height: 128))

let tap = CGPoint(x: 11, y: 10)
//tap is inside view1 since it is inside it's bound
print("tap is inside view1: \(view1.point(inside: tap, with: nil))")

let convertedTap = view1.convert(tap, to: view2)
let convertedFrom = view2.convert(tap, to: view1)
print(convertedTap, convertedFrom)
