import Foundation

var string = "first"
DispatchQueue.global().async {
    string = "add"
}

print(string)

// use serial queue to syncronise access
let lockQueue = DispatchQueue(label: "lock.queue")
lockQueue.async {
    print(string)
}

lockQueue.async {
    print(string)
}
