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

let cuncurrentQueue = DispatchQueue(label: "com.queue.Serial", attributes: .concurrent)
cuncurrentQueue.async {
        print("Task1 started")
        print("is main thread: \(Thread.isMainThread)")
        sleep(2)
        print("Task1 ended")
    
}
cuncurrentQueue.async {
        print("Task2 started")
        print("is main thread: \(Thread.isMainThread)")
        sleep(2)
        print("Task2 ended")
}
cuncurrentQueue.async {
        print("Task3 started")
        print("is main thread: \(Thread.isMainThread)")
        sleep(2)
        print("Task3 ended")
}



