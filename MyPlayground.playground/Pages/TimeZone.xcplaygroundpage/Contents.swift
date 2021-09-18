import Foundation

var str = "Hello, playground"

//: [Next](@next)
for i in TimeZone.knownTimeZoneIdentifiers {
    let t = TimeZone(identifier: i)
    print(t!, t!.abbreviation()!)

    let currentDate = Date()
    let format = DateFormatter()
    format.timeZone = t
    format.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let dateString = format.string(from: currentDate)
    print(dateString)

}
