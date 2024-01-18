//
//  SettingsView.swift
//  Flick
//
//  Created by Tomiwa Idowu on 1/6/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            Section {
                SettingsLabel(imageName: "hand.tap", text: "Behavior", backgroundColor: .gray)
                SettingsLabel(imageName: "paintbrush", text: "Apperance", backgroundColor: .blue)
                SettingsLabel(imageName: "bell", text: "Notification", backgroundColor: .red)
            }
            Section {
                Section {
                    SettingsLabel(imageName: "hand.raised", text: "Privacy Policy", backgroundColor: .indigo)
                }
            }
            Section {
                SettingsLabel(imageName: "wand.and.stars", text: "What's New", backgroundColor: .yellow)
                SettingsLabel(imageName: "info.circle", text: "About", backgroundColor: .black)
            }
        }
            .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
