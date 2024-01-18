//
//  ApiService.swift
//  JetTrivia
//
//  Created by Tomiwa Idowu on 1/5/24.
//

import Foundation

enum ApiServiceError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

class ApiService {
    func getRequest<T: Decodable>(string url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw ApiServiceError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiServiceError.invalidResponse
        }
        do {
            let decorder = JSONDecoder()
            decorder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData  = try decorder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw ApiServiceError.invalidData
        }
    }
}
