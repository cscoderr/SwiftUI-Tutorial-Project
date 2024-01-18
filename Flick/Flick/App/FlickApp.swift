//
//  FlickApp.swift
//  Flick
//
//  Created by Tomiwa Idowu on 1/6/24.
//

import SwiftUI

@main
struct FlickApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HomeViewModel())
        }
    }
}
