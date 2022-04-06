import Foundation
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Publisher where Self.Output : Hashable {
    public func distinct() -> AnyPublisher<Self.Output, Self.Failure> {
        scan((Set<Self.Output>(), nil)) { partial, element in
            partial.0.contains(element) ? (partial.0, nil) : (partial.0.union([element]), element)
        }
        .compactMap { $0.1 }
        .eraseToAnyPublisher()
    }
}
