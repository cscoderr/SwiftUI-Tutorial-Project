//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Tomiwa Idowu on 12/16/23.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
