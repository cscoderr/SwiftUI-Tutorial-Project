//
//  Contact_SwiftUIApp.swift
//  Contact-SwiftUI
//
//  Created by Tomiwa Idowu on 15/02/2023.
//

import SwiftUI

@main
struct Contact_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                FavouritesView()
                    .tabItem {
                        Label {
                            Text("Favourites")
                        } icon: {
                            Image(systemName: "star.fill")
                        }

                    }
                
                RecentsView()
                    .tabItem {
                        Label {
                            Text("Recents")
                        } icon: {
                            Image(systemName: "clock.fill")
                        }

                    }
                
                ContactsView()
                    .tabItem {
                        Label {
                            Text("Contacts")
                        } icon: {
                            Image(systemName: "person.circle.fill")
                        }

                    }
                
                KeypadView()
                    .tabItem {
                        Label {
                            Text("Keypad")
                        } icon: {
                            Image(systemName: "circle.grid.3x3")
                        }

                    }
                
                
                VoicemailView()
                    .tabItem {
                        Label {
                            Text("Keypad")
                        } icon: {
                            Image(systemName: "eyeglasses")
                        }

                    }
            }
        }
    }
}
