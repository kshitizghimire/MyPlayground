import Foundation

struct DefaultCurrencyFormatter {
    private let formatter: NumberFormatter

    init(locale: Locale) {
        formatter = NumberFormatter()
        formatter.locale = locale
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
    }

    func formatCurrency(string: String) -> String? {

        guard let doubleValue = Double(string) else {
            return nil
        }
        return formatter.string(from: NSNumber(value: doubleValue))
    }
}


let rawCurrencyString = "12888889988777777.313"
let locale = Locale(identifier: "en_AU")

let formatter = DefaultCurrencyFormatter(locale: locale)
formatter.formatCurrency(string: rawCurrencyString)

