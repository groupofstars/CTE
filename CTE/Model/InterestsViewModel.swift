import SwiftUI
import Combine

struct InterestsUpdateRequest: Codable {
    let interests: [Bool]
}

class InterestsViewModel: ObservableObject {
    @Published var isUpdated = false
    
    func updateInterests(interests: [Bool]) {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/profile/interests") else {
            return
        }
        
        let interestsUpdateRequest = InterestsUpdateRequest(interests: interests)
        let jsonData = try? JSONEncoder().encode(interestsUpdateRequest)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    self.isUpdated = true
                } else {
                    print("Interests update failed with status code: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}


