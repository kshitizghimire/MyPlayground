
import Foundation

func foo() -> Void {}
let a: () = foo()
print(type(of:a))


let animals = ["Antelope", "Butterfly", "Camel", "Dolphin"]
//for animal in animals {
//    print(animal)
//}


var animalIterator = animals.makeIterator()
while let animal = animalIterator.next() {
    print(animal)
}

let b = Optional<Int>.some(3)
print(b!)
