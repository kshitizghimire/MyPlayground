import Foundation

struct Student: Codable {
    var name: String
    var joined: Date
}


//encode

let student = Student(name: "Student name", joined: Date())
let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
encoder.dateEncodingStrategy = .secondsSince1970
let data = try! encoder.encode(student)
print(String(data: data, encoding: .utf8)!)

//decode


let stubStudent = """
{
"name": "Name",
"joined": "03-23-1999"
}
"""


let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
    let container = try decoder.singleValueContainer()
    let dateString = try container.decode(String.self)
    print(dateString)

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy"
    dateFormatter.timeZone = TimeZone.current
    print(dateFormatter.timeZone)

    return dateFormatter.date(from: dateString)!

})

do {
    let student = try decoder.decode(Student.self, from: stubStudent.data(using: .utf8)!)
    print(student)
} catch {
    print(error)
}

