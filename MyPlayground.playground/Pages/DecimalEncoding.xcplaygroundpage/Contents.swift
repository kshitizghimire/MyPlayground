import Foundation

extension Decimal {
    var formattedAmount: String? {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: self as NSDecimalNumber)
    }
}

struct Foo: Codable {
    let value: Decimal
    
    private enum CodingKeys: String, CodingKey {
        case value
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let string = self.value.formattedAmount!
        print(string)
        try container.encode(Decimal(string: string), forKey: .value)
    }

    init(from decoder: Decoder) throws {
        print("decoder")
        let containter = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try containter.decode(Decimal.self, forKey: .value)
    }
    
    init(value: Decimal) {
        self.value = value
    }
}

let foo = Foo(value: 12.113)

let encoder = JSONEncoder()
encoder.dataEncodingStrategy = .base64

let data = try? encoder.encode(foo)

print(String(data: data!, encoding: .utf8)!)


struct DecimalStruct: Codable {
    var val = Decimal(12.313)
}

struct DoubleStruct: Codable {
    var val = Double(12.313)
}

let decimalData = try JSONEncoder().encode(DecimalStruct())
print(String(data: decimalData, encoding: .utf8)!)

let doubleData = try JSONEncoder().encode(DoubleStruct())
print(String(data: doubleData, encoding: .utf8)!)

let plEncoder = PropertyListEncoder()
plEncoder.outputFormat = .xml
let decimalXMLData = try plEncoder.encode(DecimalStruct())
print(String(data: decimalXMLData, encoding: .utf8)!)

let doubleXMLData = try plEncoder.encode(DoubleStruct())
print(String(data: doubleXMLData, encoding: .utf8)!)

var myDecimal: Decimal = 12.313
print(myDecimal) // 12.313000000000002048

var result: Decimal = 0
NSDecimalRound(&result, &myDecimal, 3, .down)
print(result) // 12.313

MemoryLayout.size(ofValue: result)
MemoryLayout.size(ofValue: myDecimal)


let decimalString = Decimal(string: "12.3")
MemoryLayout.size(ofValue: decimalString)
