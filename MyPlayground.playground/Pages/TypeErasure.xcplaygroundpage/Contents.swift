import Foundation

protocol Cachable {
    associatedtype CacheType
    func decode(_ data: Data) -> CacheType?
    func encode() -> Data?
}

extension String: Cachable {
    typealias CacheType = String
    func decode(_ data: Data) -> CacheType? {
        guard let string = String(data: data, encoding: .utf8) else {
            return nil
        }
        return string
    }

    func encode() -> Data? {
        data(using: .utf8)
    }
}

class AnyCachable<T>: Cachable {
    private let _decode: (_ data: Data) -> T?
    private let _encode: () -> Data?
    init<U: Cachable>(
        _ cachable: U
    ) where U.CacheType == T {
        _decode = cachable.decode
        _encode = cachable.encode
    }

    func decode(_ data: Data) -> T? {
        _decode(data)
    }

    func encode() -> Data? {
        _encode()
    }
}

class AnyCachable2<C: Cachable>: Cachable {
    private let cachable: C

    init(
        _ cachable: C
    ) {
        self.cachable = cachable
    }

    func encode() -> Data? {
        cachable.encode()
    }

    func decode(_ data: Data) -> C.CacheType? {
        cachable.decode(data)
    }
}

struct CacheItem {
    let item: AnyCachable<String>
    let expiryDate: Date
}

let cacheItem = CacheItem(item: AnyCachable("abc"), expiryDate: Date())
let cache: [AnyCachable<String>] = [AnyCachable("Hello"), AnyCachable("World")]

struct CacheItem2 {
    let item: AnyCachable2<String>
    let expiryDate: Date
}

let cacheItem2 = CacheItem2(item: AnyCachable2("abc"), expiryDate: Date())
let cache2: [AnyCachable2<String>] = [AnyCachable2("Hello"), AnyCachable2("World")]
