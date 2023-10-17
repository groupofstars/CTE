
import SwiftUI
import Combine
struct Article: Codable {
    let id: Int
    let title: String
    let category: Category
    let company: Company
    let coverImageUrl: String
    let thumbnailImageUrl: String
    let content: String
    let publishedAt: Date
    let targetPublishAt: Date
    let expiresAt: Date
    let viewsCount: Int
    let status: String
}

struct Category: Codable {
    let id: Int
    let name: String
    let viewsCount: Int
}

struct ArticlesResponse: Codable {
    let data: [Article]
    let status: String
    let timestamp: Date
    let message: String
    let error: ErrorResponse
}

struct ErrorResponse: Codable {
    let message: String
    let code: String
    let errors: [ErrorDetail]
}

struct ErrorDetail: Codable {
    let object: String
    let field: String
    let value: String
    let message: String
}
//struct ErrorDetail: Decodable {
//    let object: String
//    let field: String
//    let value: DecodableValue
//    let message: String
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(object, forKey:.object)
//        try container.encode(field, forKey:.field)
//        try container.encode(value, forKey:.value)
//        try container.encode(message, forKey:.message)
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case object
//        case field
//        case value
//        case message
//    }
//}

enum DecodableValue: Decodable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
        } else if let intValue = try? container.decode(Int.self) {
            self = .int(intValue)
        } else if let doubleValue = try? container.decode(Double.self) {
            self = .double(doubleValue)
        } else if let boolValue = try? container.decode(Bool.self) {
            self = .bool(boolValue)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unsupported value type"
            )
        }
    }
}

class ArticlesViewModel: ObservableObject {
    @Published var articles: [Article] = []
    
    func fetchArticles(categoryId: Int) {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/articles?categoryId=\(categoryId)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                if(httpResponse.statusCode==200){
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        
                        let response = try decoder.decode(ArticlesResponse.self, from: data)
                        print("here")
                        DispatchQueue.main.async {
                            self.articles = response.data
                        }
                    } catch {
                        print("Error decoding response: \(error.localizedDescription)")
                    }
                }else{
                    print("Getting articles failed with status code: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}


