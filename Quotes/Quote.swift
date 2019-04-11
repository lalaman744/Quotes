import Foundation

struct Quote: Decodable {
    
    let id: Int
    let text: String // text of quote
    let author: String // author
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case text = "content"
        case author = "title"
        case link
    }
}
