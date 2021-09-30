import UIKit

class UITableView2 {
    var storage = [UITableViewCell]()
    func dequeueReusableCell(withIdentifier _: String) -> UITableViewCell? {
        if storage.isEmpty {
            let n = 20
            for _ in 0 ..< n {
                storage.append(UITableViewCell(frame: .zero))
            }
        } else {
            let result = storage.removeFirst()
            storage.append(result)
            return result
        }
        return nil
    }
}
