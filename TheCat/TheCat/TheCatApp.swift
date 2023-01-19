//
//  TheCatApp.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import SwiftUI

@main
struct TheCatApp: App {
    var body: some Scene {
        WindowGroup {
            TabView() {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                FavouriteView()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favorites")
                    }
                
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }
        }
    }
}
