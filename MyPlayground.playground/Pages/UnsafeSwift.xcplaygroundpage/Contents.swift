import Foundation

struct Foo {
    let x: Int = 20
    let y: Bool
}

MemoryLayout<Foo>.size
MemoryLayout<Foo>.alignment
MemoryLayout<Foo>.stride

let a: Decimal = 20.2

MemoryLayout<Int>.size
MemoryLayout<Float>.size
MemoryLayout<Float32>.size
MemoryLayout<Float64>.size
MemoryLayout<Double>.size
MemoryLayout<String>.size
MemoryLayout<Decimal>.size
