import Foundation

func decimalThroughString(from double: Double) -> Decimal {
    return Decimal(string: "\(double)")!
}

func decimalDirectly(from double: Double) -> Decimal {
    return Decimal(double)
}

func randomDecimal() -> Decimal {
    let double = Double(arc4random()) / Double(UInt32.max) * 100
    let formatter = NumberFormatter()
    formatter.decimalSeparator = "."
    formatter.maximumFractionDigits = Int(arc4random() % 20)
    let string = formatter.string(from: double as NSNumber)!
    return Decimal(string: string)!
}

var totalCorrectDirectly = 0
var totalCorrectThroughString = 0
for _ in 1...1000 {
    let decimal = randomDecimal()
    let double = (decimal as NSNumber).doubleValue
    let correctDirectly = decimalDirectly(from: double) == decimal
    let correctThroughString = decimalThroughString(from: double) == decimal
    totalCorrectDirectly += correctDirectly ? 1 : 0
    totalCorrectThroughString += correctThroughString ? 1 : 0
}
totalCorrectDirectly  // ~378
totalCorrectThroughString  // 1000
