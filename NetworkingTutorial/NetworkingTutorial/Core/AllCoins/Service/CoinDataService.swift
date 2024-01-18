//
//  CoinDataService.swift
//  NetworkingTutorial
//
//  Created by Tomiwa Idowu on 1/17/24.
//

import Foundation

class CoinDataService {
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change=_percentage=24h&locale=en"
    
    
    func fetchCoins() async -> Result<[Coin], CoinAPIError> {
        guard let url = URL(string: urlString) else {
            return .failure(.invalidData)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.requestFailed(description: "Invalid Response"))
            }
            
            guard httpResponse.statusCode == 200 else {
                return .failure(.invalidStatusCode(statusCode: httpResponse.statusCode))
            }
            
            do {
                let decoder = JSONDecoder()
                let coins = try decoder.decode([Coin].self, from: data)
                return .success(coins)
                //let error is avaiablle to us automatically by swift
            } catch let error {
                print("DEBUG: Failed to decode with error \(error)")
                return .failure(.jsonParsingFailure)
            }
            
        } catch {
            print("DEBUG: Unknown error \(error)")
            return .failure(.unknownError(error: error))
        }
    }
    
}

// MARK: - Completion Handlers

extension CoinDataService {
    func fetchCoinsWithResult(completion: @escaping (Result<[Coin], CoinAPIError>) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Request failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let coins = try decoder.decode([Coin].self, from: data)
                completion(.success(coins))
            } catch {
                print("DEBUG: Failed to decode with error \(error)")
                completion(.failure(.jsonParsingFailure))
            }
        }
        .resume()
    }
    
    
    func fetchPrice(coin: String, completion: @escaping (Double) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Failed with error \(error.localizedDescription)")
                //                    self.errorMessage = error.localizedDescription
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else  {
                //                self.errorMessage = "Bad HTTP Response"
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                //                self.errorMessage = "Failed to fetch with status code \(httpResponse.statusCode)"
                return
            }
            
            guard let data = data else { return }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            guard let value = jsonObject[coin] as? [String: Double] else { return }
            guard let price = value["usd"] else { return }
            completion(price)
        }.resume()
        
    }
}
