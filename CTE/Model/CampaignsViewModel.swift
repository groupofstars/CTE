//
//  CampaignsViewModel.swift
//  CTE
//
//  Created by Leo Taylor on 8/9/23.
//

import SwiftUI
import Combine

struct Campaign: Codable {
    let id: Int
    let name: String
    let description: String
    let legalTerms: String
    let coverImageUrl: String
    let thumbnailImageUrl: String
    let publishedAt: Date
    let targetPublishAt: Date
    let expiresAt: Date
    let status: String
}

struct CampaignsResponse: Codable {
    let data: [Campaign]
    let status: String
    let timestamp: Date
    let message: String
    let error: ErrorResponse?
}

class CampaignsViewModel: ObservableObject {
    @Published var campaigns: [Campaign] = []
    
    func fetchCampaigns() {
        guard let url = URL(string: "http://gobenefits-api.us-east-1.elasticbeanstalk.com/api/v1/campaigns") else {
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
                        
                        let response = try decoder.decode(CampaignsResponse.self, from: data)
                        
                        DispatchQueue.main.async {
                            self.campaigns = response.data
                        }
                    } catch {
                        print("Error decoding response: \(error.localizedDescription)")
                    }
                }else{
                    print("Getting campaigns failed with status code: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}
