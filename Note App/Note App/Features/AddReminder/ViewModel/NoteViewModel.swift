//
//  NoteViewModel.swift
//  Note App
//
//  Created by Tomiwa Idowu on 12/02/2023.
//

import Foundation
import CoreData

class NoteDataController: ObservableObject {
    let container = NSPersistentContainer(name: "Note")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load \(error.localizedDescription)")
            }
        }
    }
}
