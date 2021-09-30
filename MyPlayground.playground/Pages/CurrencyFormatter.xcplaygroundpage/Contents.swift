import Foundation

struct DefaultCurrencyFormatter {
    private let formatter: NumberFormatter

    init(
        locale: Locale = Locale(identifier: "en_AU")
    ) {
        formatter = NumberFormatter()
        formatter.locale = locale
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
    }

    func formatCurrency(string: String) -> String? {
        guard let decimal = Decimal(string: string) else {
            return nil
        }
        return formatter.string(from: NSDecimalNumber(decimal: decimal))
    }
}

let amount = "-12888889988777777.313"
let formatter = DefaultCurrencyFormatter()
formatter.formatCurrency(string: amount)
