
import UIKit

let view1 = UIView()

let view2 = UIView()

var set = Set<NSObject>()
set.insert(view1)
set.insert(view2)
print(view1.hash)

class Foo: NSObject {
    
}

let foo1 = Foo()

set.insert(foo1)
print(set)
