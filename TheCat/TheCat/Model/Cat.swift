//
//  Cat.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import Foundation

struct Cat: Codable, Equatable, Hashable {
    let id, url: String
    let width, height: Double
    let breeds: [Breed]
    
}

struct Breed: Codable, Equatable, Hashable {
    let id: String
    let name: String
    let description: String
    let temperament: String
}
