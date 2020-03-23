//: [Previous](@previous)

import UIKit

struct ViewTraverser {
    
    func traverseSuperview(view: UIView) -> [Int: UIView] {
        
        
        
        var set = Set<UIView>()
        var output = [Int: UIView]()
        var current: UIView?
        current = view.superview
        while current != nil {
            guard let tag = current?.tag,
                let view = current else {
                    continue
            }
            output[tag] = view
            print(view.hashValue)
            print(view.hash)
            set.insert(view)
            current = view.superview
        }
        print(set)
        return output
    }
    
}

let view = UIView()
let viewOne = UIView()
let viewTwo = UIView()
let viewThree = UIView()
let intermediaryView = UIView()
let viewSuper = UIView()

viewOne.tag = 22
viewTwo.tag = 23
viewSuper.tag = 10
view.tag = 12
intermediaryView.addSubview(viewOne)
intermediaryView.tag = 8
viewThree.tag = 33
viewThree.addSubview(viewTwo)
view.addSubview(viewThree)
view.addSubview(intermediaryView)

let traverser = ViewTraverser()
traverser.traverseSuperview(view: viewOne)
