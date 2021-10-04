import Foundation

struct Cache<Key: Hashable, Value> {
    private let wrapped = NSCache<WrappedKey, WrappedValue>()

    func insert(_ value: Value, forKey key: Key) {
        let wrappedValue = WrappedValue(value: value)
        wrapped.setObject(wrappedValue, forKey: WrappedKey(key))
    }

    func value(forKey key: Key) -> Value? {
        let wrappedValue = wrapped.object(forKey: WrappedKey(key))
        return wrappedValue?.value
    }

    func removeValue(forKey key: Key) {
        wrapped.removeObject(forKey: WrappedKey(key))
    }
}

extension Cache {
    subscript(key: Key) -> Value? {
        get { value(forKey: key) }
        set {
            guard let value = newValue else {
                // If nil was assigned using our subscript,
                // then we remove any value for that key:
                removeValue(forKey: key)
                return
            }

            insert(value, forKey: key)
        }
    }
}

private extension Cache {
    final class WrappedKey: NSObject {
        let key: Key

        init(_ key: Key) { self.key = key }

        override var hash: Int { key.hashValue }

        override func isEqual(_ object: Any?) -> Bool {
            guard let value = object as? WrappedKey else {
                return false
            }

            return value.key == key
        }
    }
}

private extension Cache {
    final class WrappedValue {
        let value: Value

        init(value: Value) {
            self.value = value
        }
    }
}


var cache = Cache<String, String>()
cache["abc"] = "aaa"
print(cache["abc"])
print(cache["foo"])


