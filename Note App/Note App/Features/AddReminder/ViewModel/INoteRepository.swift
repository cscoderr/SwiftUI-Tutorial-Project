//
//  INoteRepository.swift
//  Note App
//
//  Created by Tomiwa Idowu on 12/02/2023.
//

import Foundation

protocol INoteRepository {
    func getNotes() -> [String]
    func addNote()
}

class NoteRepository: INoteRepository {
    func getNotes() -> [String] {
        return ["tommy", "tommy"]
    }
    
    func addNote() {
        
    }
    
    
}
