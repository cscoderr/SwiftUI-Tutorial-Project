//
//  TheCatApp.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import SwiftUI

@main
struct TheCatApp: App {
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false
    @StateObject private var dataController = DataController()
//    @FetchRequest(sortDescriptors: []) var likes: FetchedResults<Likes>
    
    var body: some Scene {
        WindowGroup {
            TabView() {
                HomeView()
//                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    
                
                FavouriteView()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favorites")
                    }
                
                SettingsView(
                    darkModeEnabled: $darkModeEnabled,
                    systemThemeEnabled: $systemThemeEnabled
                )
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }
            //\.managedObjectContext is theLive version of your data
            //dataController.container.viewContext let us work with all our data in the memory
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .onAppear {
                SystemThemeManager.shared.handleTheme(
                    darkMode: darkModeEnabled,
                    system: systemThemeEnabled)
            }
        }
    }
}
