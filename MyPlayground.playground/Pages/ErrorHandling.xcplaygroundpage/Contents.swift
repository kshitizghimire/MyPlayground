import Foundation



struct Foo {
    
    enum FooError: Error {
        case nilValue
    }
    
    func compute(parameter: String?) throws -> String {
        
        guard let parameter = parameter else {
            throw FooError.nilValue
        }
        
        return parameter
    }
}


struct Foo2 {
    
    enum FooError2: Error {
        case nilValue2
    }
    
    func compute(parameter: String?) throws -> String {
        
        guard let parameter = parameter else {
            throw FooError2.nilValue2
        }
        
        return parameter
    }
}


func some() throws {
    try Foo().compute(parameter:"1")
    try Foo2().compute(parameter:nil)
}


do {
    try some()
} catch Foo2.FooError2.nilValue2 {
    print("error 2")
    
} catch Foo.FooError.nilValue {
    print("error 1")
    
} catch {
    print(error)
}
