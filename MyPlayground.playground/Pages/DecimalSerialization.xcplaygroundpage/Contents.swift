import Foundation

struct DecimalStruct: Codable {
    var val = Decimal(string: "12.313")
}

struct DoubleStruct: Codable {
    var val = Double(12.313)
}

let decimalData = try JSONEncoder().encode(DecimalStruct())
print("Encoded Decimal " + String(data: decimalData, encoding: .utf8)!)

let doubleData = try JSONEncoder().encode(DoubleStruct())
print("Encoded Double " +  String(data: doubleData, encoding: .utf8)!)

print("typea: \(type(of: DecimalStruct().val)) --")


var serializedDecimal = try JSONSerialization.jsonObject(with: decimalData, options: []) as! [String: Any]
type(of: serializedDecimal)
print("typea: \(type(of: serializedDecimal["val"]!)) --")
print("sizeOf: \(MemoryLayout.size(ofValue: serializedDecimal["val"]!)) --")
let cfNumbner = serializedDecimal["val"] as! CFNumber
print("cfType: \(CFNumberGetType(cfNumbner).rawValue) -- \(CFNumberType.float64Type.rawValue)")

serializedDecimal["val"] =  Decimal(string: "12.313")
print("typea: \(type(of: serializedDecimal["val"]!)) --")
let reserializedData = try JSONSerialization.data(withJSONObject: serializedDecimal)
print("reSerialized Decimal " + String(data: reserializedData, encoding: .utf8)!)
print("sizeOf: \(MemoryLayout.size(ofValue: Decimal(12))) --")

let serializedDouble = try JSONSerialization.jsonObject(with: doubleData, options: []) as! [String: Any]
print(serializedDouble)
