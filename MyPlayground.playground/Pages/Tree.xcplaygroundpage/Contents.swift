
class Node<T> {
    var value: T
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

extension Node: CustomStringConvertible {
    // 2
    var description: String {
        // 3
        var text = "\(value)"
        
        // 4
        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}

let beverages = Node(value: "beverages")

let hotBeverage = Node(value: "hot")
let coldBeverage = Node(value: "cold")

let tea = Node(value: "tea")
let coffee = Node(value: "coffee")
let cocoa = Node(value: "cocoa")

let blackTea = Node(value: "black")
let greenTea = Node(value: "green")
let chaiTea = Node(value: "chai")

let soda = Node(value: "soda")
let milk = Node(value: "milk")

let gingerAle = Node(value: "ginger ale")
let bitterLemon = Node(value: "bitter lemon")

beverages.add(child: hotBeverage)
beverages.add(child: coldBeverage)

hotBeverage.add(child: tea)
hotBeverage.add(child: coffee)
hotBeverage.add(child: cocoa)

coldBeverage.add(child: soda)
coldBeverage.add(child: milk)

tea.add(child: blackTea)
tea.add(child: greenTea)
tea.add(child: chaiTea)

soda.add(child: gingerAle)
soda.add(child: bitterLemon)

print(beverages)

extension Node where T: Equatable {
    // 1
    func search(value: T) -> Node? {
        // 2
        if value == self.value {
            return self
        }
        // 3
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        // 4
        return nil
    }
}

beverages.search(value: "cocoa") // returns the "cocoa" node
beverages.search(value: "chai") // returns the "chai" node
beverages.search(value: "1") // returns nil
