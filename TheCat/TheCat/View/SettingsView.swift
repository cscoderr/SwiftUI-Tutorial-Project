//
//  SettingsView.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import SwiftUI

struct SettingsView: View {
    @Binding var darkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool
    var body: some View {
     
        NavigationView {
            Form {
                Section(header: Text("Display"),
                 footer:
                    Text("System settings will override the dark mode and use the current device theme")
                ) {
                    Toggle(isOn: $darkModeEnabled) {
                        Text("Dark Mode")
                    }
                    .onChange(of: darkModeEnabled) { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
                    }
                    
                    Toggle(isOn: $systemThemeEnabled) {
                        Text("Use system settings")
                    }
                    .onChange(of: systemThemeEnabled) { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
                    }
                }
                
                Section {
                    Link(destination: URL(string: "https://twitter.com/cscoder_")!) {
                        Label("Follow on twitter @cscoderr", systemImage: "link")
                    }
                    
                    Link("Contact me via email", destination: URL(string: "mailto:toomy@gmail.com")!)
                    
                    Link("Call me", destination: URL(string: "tel:09024863661")!)
                }
                .foregroundColor(Theme.textColor)
                .font(.system(size: 16, weight: .bold))

            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(
            darkModeEnabled: .constant(false), systemThemeEnabled: .constant(true))
    }
}
