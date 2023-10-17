import SwiftUI
import Combine
struct SignupConfirmRequest: Codable {
    let userId: String
    let username: String
    let password: String
    let privacyPolicyAgreed: Bool
    let dataProcessAgreed: Bool
}
class SignupConfirmViewModel: ObservableObject {
    @Published var isSignupConfirmed = false
    
    func signupConfirm(userId: String, username: String, password: String, privacyPolicyAgreed: Bool, dataProcessAgreed: Bool) {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/signup/confirm") else {
            return
        }
        
        let signupConfirmRequest = SignupConfirmRequest(userId: userId, username: username, password: password, privacyPolicyAgreed: privacyPolicyAgreed, dataProcessAgreed: dataProcessAgreed)
        let jsonData = try? JSONEncoder().encode(signupConfirmRequest)
        
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
                    username_signup=username
                    password_signup=password
                    self.isSignupConfirmed = true
                } else {
                    print("Signup confirmation failed with status code: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}
