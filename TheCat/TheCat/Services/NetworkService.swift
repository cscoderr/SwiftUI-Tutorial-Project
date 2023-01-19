//
//  NetworkService.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import Foundation

struct NetworkService {
    static let shared = NetworkService()
    
//    func makeRequest<T: Decodable>(with url: String, type: T) -> T? {
//        guard let url = URL(string: url) else {
//            return nil
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data, error != nil else {
//                return
//            }
//            do {
//                let json = JSONDecoder()
//                let res = try json.decode(T.self, from: data)
////                return res
//            } catch {
////                return nil
//            }
//        }
//        task.resume()
//        
//    }
}
