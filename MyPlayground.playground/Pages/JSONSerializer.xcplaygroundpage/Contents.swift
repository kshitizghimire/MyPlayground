import Foundation

struct Foo: Codable {
    var decimal: Decimal
    var string: String
    var bool: Bool
    var double: Double
}


let foo = Foo(decimal: Decimal(string: "12.313")!, string: "Some", bool: true, double: 12.313)

let encoder = JSONEncoder()
let encoded = try? encoder.encode(foo)
print(MemoryLayout.size(ofValue: foo.decimal))
print(MemoryLayout.size(ofValue: foo.string))
print(MemoryLayout.size(ofValue: foo.bool))
print(String(data: encoded!, encoding: .utf8)!)

let serialized = try? JSONSerialization.jsonObject(with: encoded!) as! [String: Any]
let decimal = serialized?["decimal"]!
let string = serialized?["string"]!
let bool = serialized?["bool"]!
print(MemoryLayout.size(ofValue: decimal))
print(MemoryLayout.size(ofValue: string))
print(MemoryLayout.size(ofValue: bool))
print(serialized!)

let deSerialized = try? JSONSerialization.data(withJSONObject: serialized!)
type(of: deSerialized)
print(String(data: deSerialized!, encoding: .utf8)!)
let decoder = JSONDecoder()
let foo2 = try! decoder.decode(Foo.self, from: deSerialized!)
print(MemoryLayout.size(ofValue: foo2.decimal))
print(MemoryLayout.size(ofValue: foo2.string))
print(MemoryLayout.size(ofValue: foo2.bool))
print(foo2)
