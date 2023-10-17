
import SwiftUI
import Combine

struct LoginRequest: Codable {
    let username: String
    let password: String
}

class LoginViewModel: ObservableObject {
    @Published var isLoggedIn = false
    
    func login(username: String, password: String) {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/login") else {
            return
        }
        
        let loginRequest = LoginRequest(username: username, password: password)
        let jsonData = try? JSONEncoder().encode(loginRequest)
        
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
                    self.isLoggedIn = true
                } else {
                   
                    print("Login failed with status code: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}
