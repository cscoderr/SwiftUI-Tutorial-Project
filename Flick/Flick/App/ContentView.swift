//
//  ContentView.swift
//  Flick
//
//  Created by Tomiwa Idowu on 1/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack { HomeView() }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            NavigationStack { ExploreView() }
                .tabItem {
                    Label("Explore", systemImage: "popcorn.fill")
                }
            NavigationStack {  WatchListView() }
                .tabItem {
                    Label("Watchlist", systemImage: "square.stack.fill")
                }
            NavigationStack { SearchView() }
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            NavigationStack { SettingsView() }
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
