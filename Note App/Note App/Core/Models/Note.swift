//
//  Note.swift
//  Note App
//
//  Created by Tomiwa Idowu on 12/02/2023.
//

import Foundation

struct Note: Identifiable, Codable {
    var id: UUID
    var title: String
    var content: String
    var createdAt: Date?
    
    init(id: UUID, title: String, content: String, createdAt: Date) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.createdAt = createdAt
    }
}
