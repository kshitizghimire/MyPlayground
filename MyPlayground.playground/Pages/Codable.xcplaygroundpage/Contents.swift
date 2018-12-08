//: [Previous](@previous)

import Foundation

struct Movie: Codable {
    enum MovieGenere: String, Codable {
        case horror, comedy, adventure, animation
    }
    
    let name : String
    let moviesGenere : [MovieGenere]
    let rating : Int
}

let upMovie = Movie(name: "Up", moviesGenere: [.comedy , .adventure, .animation], rating : 4)

print(upMovie)

// Encode data
let jsonEncoder = JSONEncoder()
do {
    let jsonData = try jsonEncoder.encode(upMovie)
    let jsonString = String(data: jsonData, encoding: .utf8)
    print("JSON String : " + jsonString!)
}
catch {
}


let jsonString = "{\"name\":\"Up\",\"moviesGenere\":[\"comedy\",\"adventure\",\"animation\"],\"rating\":4}"
let jsonData = jsonString.data(using: .utf8)

// Decode data
do {
    let jsonDecoder = JSONDecoder()
    let upMovie = try jsonDecoder.decode(Movie.self, from: jsonData!)
    print("Name : \(upMovie.name)")
    print("Rating : \(upMovie.rating)")
}
catch {
}
