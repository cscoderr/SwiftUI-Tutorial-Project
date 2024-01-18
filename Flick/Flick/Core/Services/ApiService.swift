//
//  ApiService.swift
//  Flick
//
//  Created by Tomiwa Idowu on 1/8/24.
//

import Foundation


protocol ApiService {
    func getRequest<T: Decodable>(with url: String) async throws -> T
    
    func postRequest() async throws
    
    func deleteRequest() async throws
}


class ApiServiceImpl: ApiService {
    
    func getRequest<T: Decodable>(with url: String) async throws -> T {
        let url = URL(string: url)!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        let decodedData  = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
    
    func postRequest() async throws {
        <#code#>
    }
    
    func deleteRequest() async throws {
        <#code#>
    }
    
}
