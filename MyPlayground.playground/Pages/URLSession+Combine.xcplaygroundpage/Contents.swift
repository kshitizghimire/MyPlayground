import Combine
import Foundation
import PlaygroundSupport
import UIKit

struct Github: Codable {
    let name: String
}

class ViewController: UIViewController {
    var urlComponent: URLComponents = {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "api.github.com"
        urlComponent.path = "/users/kshitizghimire"
        return urlComponent
    }()

    var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: urlComponent.url!)
        let publisher = URLSession.shared.dataTaskPublisher(for: request)

        publisher

            .tryMap { element -> Data in
                //                print(element.data)
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200
                else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: Github.self, decoder: JSONDecoder())

        cancellable = publisher.sink { _ in
            //            print(complition)
        } receiveValue: { github in
            print(github)
        }
    }
}

let vc = ViewController()
vc.loadViewIfNeeded()

PlaygroundPage.current.needsIndefiniteExecution = true
