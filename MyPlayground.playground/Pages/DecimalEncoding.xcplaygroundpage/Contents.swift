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


