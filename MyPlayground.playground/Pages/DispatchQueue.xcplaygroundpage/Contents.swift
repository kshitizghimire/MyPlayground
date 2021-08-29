import Foundation

let serialQueue = DispatchQueue(label: "com.queue.Serial")
serialQueue.async {
    print("Task1 started")
    print("is main thread: \(Thread.isMainThread)")
    sleep(2)
    print("Task1 ended")

}
serialQueue.async {
    print("Task2 started")
    print("is main thread: \(Thread.isMainThread)")
    sleep(2)
    print("Task2 ended")
}

let cuncurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
cuncurrentQueue.async {
    print("\(cuncurrentQueue.label) Task1 started")
    print("\(cuncurrentQueue.label) is main thread: \(Thread.isMainThread)")
    sleep(2)
    print("\(cuncurrentQueue.label) Task1 ended")

}
cuncurrentQueue.async {
    print("\(cuncurrentQueue.label) Task2 started")
    print("\(cuncurrentQueue.label) is main thread: \(Thread.isMainThread)")
    sleep(2)
    print("\(cuncurrentQueue.label) Task2 ended")
}
cuncurrentQueue.async {
    print("\(cuncurrentQueue.label) Task3 started")
    print("\(cuncurrentQueue.label) is main thread: \(Thread.isMainThread)")
    sleep(2)
    print("\(cuncurrentQueue.label) Task3 ended")
}
