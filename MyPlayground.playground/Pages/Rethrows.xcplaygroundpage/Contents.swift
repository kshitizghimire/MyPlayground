import Foundation

struct Foo {
    var string: String

    let closure: () throws -> Data = {
        Data()
    }

    init(
        string: String,
        closure _: () throws -> Data
    ) rethrows {
        self.string = string
    }
}
