import Foundation

let serialQueue = DispatchQueue(label: "com.queue.Serial", attributes: .concurrent)
for i in 1...5 {
    serialQueue.async {
        print(Thread.isMainThread)
        print("\(i)")
        sleep(2)
    }
}


class AAA {
    let p: String
    static var bbb: AAA {
        return AAA(p: "P")
    }
    
    init(p: String) {
        self.p = p
    }
   
}


