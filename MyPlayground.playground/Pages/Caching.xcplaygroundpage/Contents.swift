import Foundation

protocol Caching {
    associatedtype Key = AnyHashable
    associatedtype Value
    subscript(key: Key) -> Value? { get set }
}

struct MemoryCache<Key: Hashable, Value>: Caching {
    private var cache = [Key: Value]()

    subscript(key: Key) -> Value? {
        get {
            cache[key]
        }
        set {
            cache[key] = newValue
        }
    }
}

struct ThreadSafeCache<T: Caching>: Caching {
    private(set) var decoratee: T
    private let lockQueue = DispatchQueue(label: "Lock.Queue", attributes: .concurrent)

    subscript(key: T.Key) -> T.Value? {
        get {
            lockQueue.sync {
                decoratee[key]
            }
        }
        set {
            lockQueue.sync(flags: .barrier) {
                decoratee[key] = newValue
            }
        }
    }
}

struct StringLoader<T: Caching> where T.Value == String, T.Key == String {
    var cache: T

    func get(_ key: String) -> String? {
        cache[key]
    }

    mutating func setValue(_ value: String, for key: String) {
        cache[key] = value
    }
}

let cache = MemoryCache<String, String>()
let threadSafeCache = ThreadSafeCache(decoratee: cache)
type(of: cache)
var stringLoader = StringLoader(cache: threadSafeCache)
print(stringLoader.get("Hello") ?? "<nil>")

stringLoader.setValue("world", for: "Hello")
print(stringLoader.get("Hello") ?? "<nil>")
