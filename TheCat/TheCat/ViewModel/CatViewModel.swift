//
//  CatViewModel.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import Foundation

class CatViewModel: ObservableObject {
    @Published private(set) var cats: [Cat]?
    @Published private(set) var searchResult: [Cat]?
    @Published var hasError: Bool = false
    @Published private(set) var mainError: String?
    
    func getCats() {
        guard let url = URL(string: "\(AppConfig.baseUrl)/images/search?limit=10&has_breeds=1&api_key=\(AppConfig.apiKey)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data {
                do {
                    let response = try JSONDecoder().decode([Cat].self, from: data)
                    print(response)
                    DispatchQueue.main.async {
                        self.cats = response
                    }
                    
                } catch {
                    print(error)
                    DispatchQueue.main.async {
                        self.hasError = true
                        self.mainError = "An error occur Try again"
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.hasError = true
                    self.mainError = "An error occur Try again"
                }
            }
        }
        
        task.resume()
    }
    
    func searchCats(_ query: String) {
        if query.isEmpty {
            self.getCats()
            return
        }
        print("\(AppConfig.baseUrl)/images/search?breed_ids=\(query.lowercased())&api_key=\(AppConfig.apiKey)")
        guard let url = URL(string: "\(AppConfig.baseUrl)/images/search?breed_ids=\(query)&api_key=\(AppConfig.apiKey)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data {
                do {
                    let response = try JSONDecoder().decode([Cat].self, from: data)
                    print(response)
                    DispatchQueue.main.async {
                        self.cats = response
                    }
                    
                } catch {
                    print(error)
                    DispatchQueue.main.async {
                        self.hasError = true
                        self.mainError = "An error occur Try again"
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.hasError = true
                    self.mainError = "An error occur Try again"
                }
            }
        }
        
        task.resume()
    }
}
