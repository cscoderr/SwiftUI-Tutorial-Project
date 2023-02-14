//
//  DataController.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 21/01/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    //Tells core data we want to use Favourite data model
    let container = NSPersistentContainer(name: "Favorite")
    
    init() {c
        //Used to access our saved data from data model
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data fail to load \(error.localizedDescription)")
            }
        }
    }
}
