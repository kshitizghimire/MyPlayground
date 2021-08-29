import Foundation

let dict = ["key": "value"]

struct Foo: Decodable {
    let key: String
}

let propertyListData = try? PropertyListSerialization.data(
    fromPropertyList: dict,
    format: .binary,
    options: 0
)
print(propertyListData!)

let val = try PropertyListDecoder().decode(Foo.self, from: propertyListData!)
print(val)

print(String(data: propertyListData!, encoding: .utf8))

let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
print(jsonData)
print(try JSONDecoder().decode(Foo.self, from: jsonData!))
print(String(data: jsonData!, encoding: .utf8))
