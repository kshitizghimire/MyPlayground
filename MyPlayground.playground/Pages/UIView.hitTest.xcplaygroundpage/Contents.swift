
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
        return self.point(inside: point, with: event)
    }
    //    open func point(inside point: CGPoint, with event: UIEvent?) -> Bool
}



let view1 = UIView(frame: CGRect(x: 50, y: 50, width: 128, height: 128))
let view2 = UIView(frame: CGRect(x: 200, y: 200, width: 128, height: 128))

let tap = CGPoint(x: 10, y: 10)
let convertedTap = view1.convert(tap, to: view2)
let convertedFrom = view2.convert(tap, from: view1)
print(convertedTap, convertedFrom)
