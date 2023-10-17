//
//  ValidateCodeViewModel.swift
//  CTE
//
//  Created by Leo Taylor on 8/9/23.
//

import SwiftUI
import Combine

struct ValidateCodeRequest: Codable {
    let userId: String
    let code: String
}

class ValidateCodeViewModel: ObservableObject {
    @Published var isCodeValidated = false
    
    func validateCode(userId: String, code: String) {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/signup/validate") else {
            return
        }
        
        let validateCodeRequest = ValidateCodeRequest(userId: userId, code: code)
        let jsonData = try? JSONEncoder().encode(validateCodeRequest)
        
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
                    self.isCodeValidated = true
                } else {
                    print("Code validation failed with status code: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
    func resendCode(userId: String) {
            guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/signup/resend-code") else {
                return
            }
            
            let resendCodeRequest = ValidateCodeRequest(userId: userId, code: "")
            let jsonData = try? JSONEncoder().encode(resendCodeRequest)
            
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
                        print("Code resend successful")
                    } else {
                        print("Code resend failed with status code: \(httpResponse.statusCode)")
                    }
                }
            }.resume()
        }
}
