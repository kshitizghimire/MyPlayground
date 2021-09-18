import Combine
import Foundation
import UIKit

let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .none

let date = Date(timeIntervalSinceReferenceDate: 118800)

// US English Locale (en_US)
dateFormatter.locale = Locale(identifier: "en_AU")
print(dateFormatter.string(from: date))

let text = UITextView()
let textPublisher = text.publisher(for: \.text)
    .compactMap { $0 }

textPublisher.sink { tt in
    print(tt)
}

text.text = "asdfd"
