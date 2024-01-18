//
//  Question.swift
//  JetTrivia
//
//  Created by Tomiwa Idowu on 1/5/24.
//

import Foundation

struct Question: Decodable, Identifiable, Hashable {
    let id: UUID = UUID()
    let answer: String
    let category: String
    let choices: [String]
    let question: String
    
//    enum CodingKeys: String, CodingKey {
//        case answer, category, choices, question
//    }
}
