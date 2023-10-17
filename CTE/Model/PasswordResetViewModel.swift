import SwiftUI
import Combine

struct PasswordResetRequest: Codable {
    let additionalProp1: String
    let additionalProp2: String
    let additionalProp3: String
}

class PasswordResetViewModel: ObservableObject {
    @Published var isReset = false
    
    func resetPassword(additionalProp1: String, additionalProp2: String, additionalProp3: String) {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/reset-password") else {
            return
        }
        
        let passwordResetRequest = PasswordResetRequest(additionalProp1: additionalProp1, additionalProp2: additionalProp2, additionalProp3: additionalProp3)
        let jsonData = try? JSONEncoder().encode(passwordResetRequest)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    self.isReset = true
                } else {
                    print("Password reset failed with status code: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}
