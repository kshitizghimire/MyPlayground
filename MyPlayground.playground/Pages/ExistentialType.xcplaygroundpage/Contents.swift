import Foundation

protocol Shape {
  var width: Double { get }
  var height: Double { get }
}

struct Rectangle: Shape {
  var width: Double
  var height: Double
  var area: Double
}

let rec: Shape = Rectangle(
  width: 1,
  height: 2,
  area: 2
)

//rec.area // ❌

let rec1 = Rectangle(
  width: 1,
  height: 2,
  area: 2
)


func addShape<T: Shape>(_ shape: T) -> T {
    print(type(of: shape)) // Rectangle
    return shape
}
let rec2 = addShape(rec1)

print(rec2.area) // ✅
