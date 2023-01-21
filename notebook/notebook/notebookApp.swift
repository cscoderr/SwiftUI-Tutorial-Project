//
//  notebookApp.swift
//  notebook
//
//  Created by Tomiwa Idowu on 21/01/2023.
//

import SwiftUI

@main
struct notebookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
