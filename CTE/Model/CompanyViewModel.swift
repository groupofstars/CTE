import SwiftUI
import Combine

//struct Company1: Codable, Identifiable {
//    let id: Int
//    let name: String
//    let businessName: String
//    let taxId: String
//    let businessEmail: String
//    let mobilePhone: String
//    let hasPhysicalStore: Bool
//    let stores: [Store]
//    let status: String
//}


struct ResponseData: Codable {
    let data: [Company]
    let status: String
    let timestamp: String
    let message: String
    let error: String?
}

struct Company: Codable,Identifiable {
    let id: Int
    let name: String
    let businessName: String
    let taxId: String
    let businessEmail: String
    let mobilePhone: String
    let hasPhysicalStore: Bool
    let stores: [Store]
    let status: String?
}

struct Store: Codable {
    let id: Int
    let name: String
    let department: String
    let province: String
    let district: String
    let address: String
    let email: String
    let mobilePhone: String
}


class CompanyViewModel: ObservableObject {
    @Published var companies: ResponseData
    init() {
            self.companies = ResponseData(data: [], status: "", timestamp: "", message: "", error: nil)
        }
        
    func fetchCompanies() {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/companies") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                   
                    do {
                        let decodedResponse = try JSONDecoder().decode(ResponseData.self, from: data)
                        DispatchQueue.main.async {
                            self.companies = decodedResponse
                        }
                    } catch {
                        print("Error decoding response: \(error.localizedDescription)")
                    }
                } else {
                    print("Fetch companies failed with status code: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}
