

struct ShippingOptions: OptionSet {
    let rawValue: Int
    
    static let nextDay    = ShippingOptions(rawValue: 1 << 0)
    static let secondDay  = ShippingOptions(rawValue: 1 << 1)
    static let priority   = ShippingOptions(rawValue: 1 << 2)
    static let standard   = ShippingOptions(rawValue: 1 << 3)
    
    static let express: ShippingOptions = [.nextDay, .secondDay]
    static let all: ShippingOptions = [.express, .priority, .standard]
}

var freeOptions: ShippingOptions = []
type(of: freeOptions)

ShippingOptions.self

print(freeOptions)
freeOptions.insert(.standard)
freeOptions.insert(.priority)
freeOptions.insert(.all)
freeOptions.insert(.express)
print(freeOptions)

freeOptions.contains(.nextDay)
