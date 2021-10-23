import Foundation

let temperature: Measurement<UnitTemperature> = Measurement(value: 50, unit: .celsius)
let converter: MeasurementFormatter = MeasurementFormatter()
converter.locale = Locale(identifier: "en_AU")
let string = converter.string(from: temperature)

converter.string(
    from: Measurement(value: 100, unit: UnitSpeed.kilometersPerHour)
)

