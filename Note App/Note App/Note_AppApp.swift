//
//  Note_AppApp.swift
//  Note App
//
//  Created by Tomiwa Idowu on 30/01/2023.
//

import SwiftUI

@main
struct Note_AppApp: App {
    @StateObject private var dataController = NoteDataController()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
