import SwiftUI
import Combine

struct PasswordChangeRequest: Codable {
    let currentPassword: String
    let newPassword: String
    let confirmPassword: String
}

class PasswordChangeViewModel: ObservableObject {
    @Published var isChanged = false
    
    func changePassword(currentPassword: String, newPassword: String, confirmPassword: String) {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/change-password") else {
            return
        }
        
        let passwordChangeRequest = PasswordChangeRequest(currentPassword: currentPassword, newPassword: newPassword, confirmPassword: confirmPassword)
        let jsonData = try? JSONEncoder().encode(passwordChangeRequest)
        
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
                    self.isChanged = true
                } else {
                    print("Password change failed with status code: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}
