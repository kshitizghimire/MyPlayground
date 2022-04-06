import Foundation
import Combine

var cancellables = Set<AnyCancellable>()

let randomNumberGenerator = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()
    .map { _ in Int.random(in: 1...100) }

randomNumberGenerator
    .sink { number in
        print(number)
    }
    .store(in: &cancellables)

randomNumberGenerator
    .sink { number in
        print(number)
    }
    .store(in: &cancellables)
