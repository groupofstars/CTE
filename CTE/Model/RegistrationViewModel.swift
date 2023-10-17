
import SwiftUI
import Combine
struct UserRegistrationRequest: Codable {
    let names: String
    let paternalSurname: String
    let maternalSurname: String
    let gender: String
    let nationalId: String
    let address: String
    let email: String
    let mobilePhone: String
    let companyId: Int
    
}

class RegistrationViewModel: ObservableObject {
    @Published var isRegistered = false
    
    func registerUser(names: String, paternalSurname: String, maternalSurname: String, gender: String, nationalId: String, address: String, email: String, mobilePhone: String, companyId: Int) {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/signup/attempt") else {
            return
        }
        
        let registrationRequest = UserRegistrationRequest(names: names, paternalSurname: paternalSurname, maternalSurname: maternalSurname, gender: gender, nationalId: nationalId, address: address, email: email, mobilePhone: mobilePhone, companyId: companyId)
        let jsonData = try? JSONEncoder().encode(registrationRequest)
        
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
                    self.isRegistered = true
                    
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            if let userIdd = json["userId"] as? String {
                                userId = userIdd
                                print("userid:"+userId)
                            }
                        }
                    } catch {
                        print("Error parsing response: \(error.localizedDescription)")
                    }
                    
                } else {
                    print("Registration failed with status code: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}

