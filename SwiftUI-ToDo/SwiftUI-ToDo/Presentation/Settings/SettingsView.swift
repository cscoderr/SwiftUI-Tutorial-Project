//
//  SettingsView.swift
//  SwiftUI-ToDo
//
//  Created by Tomiwa Idowu on 1/15/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Image(systemName: "sun.min")
                            .padding(.all, 6)
                            .background(.blue)
                            .clipShape(Circle())
                        
                        Text("Theme")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    HStack {
                        Image(systemName: "star")
                            .padding(.all, 6)
                            .background(.yellow)
                            .clipShape(Circle())
                        
                        Text("Give a Star")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: "info.circle")
                            .padding(.all, 6)
                            .background(.red
                            )
                            .clipShape(Circle())
                        
                        Text("About")
                    }
                    HStack {
                        Image(systemName: "person")
                            .padding(.all, 6)
                            .background(.gray)
                            .clipShape(Circle())
                        
                        Text("Developer")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
