
import SwiftUI
import Combine

struct RaffleQuestion: Codable {
    let id: Int
    let text: String
    let raffle: String
}

struct RaffleData: Codable {
    let id: Int
    let name: String
    let publishedAt: Date
    let targetPublishAt: Date
    let expiresAt: Date
    let coverImageUrl: String
    let thumbnailImageUrl: String
    let status: String
    let description: String
    let legalTerms: String
    let questions: [RaffleQuestion]
}

struct RaffleResponse: Codable {
    let data: [RaffleData]
    let status: String
    let timestamp: Date
    let message: String
    let error: RaffleError?
}

struct RaffleError: Codable {
    let message: String
    let code: String
    let errors: [RaffleErrorDetail]
}

struct RaffleErrorDetail: Codable {
    let object: String
    let field: String
    let value: String
    let message: String
}

class RafflesViewModel: ObservableObject {
    @Published var raffles: [RaffleData] = []
        
    func fetchRaffles() {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/raffles") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let data = data else {
                        print("No data received")
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let raffleResponse = try decoder.decode(RaffleResponse.self, from: data)
                        
                        DispatchQueue.main.async {
                            self.raffles = raffleResponse.data
                        }
                    } catch {
                        print("Error decoding response: \(error.localizedDescription)")
                    }
                } else {
                    print("Fetch Raffles failed with status code: \(httpResponse.statusCode)")
                }
            }
        }
        
        task.resume()
    }
    func getRaffleByID(id: Int) {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/raffles/\(id)") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let data = data else {
                        print("No data received")
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let raffleResponse = try decoder.decode(RaffleResponse.self, from: data)
                        
                        DispatchQueue.main.async {
                            self.raffles = raffleResponse.data
                        }
                    } catch {
                        print("Error decoding response: \(error.localizedDescription)")
                    }
                } else {
                    print("Fetch Raffles failed with status code: \(httpResponse.statusCode)")
                }
            }
        }
        
        task.resume()
    }
}

