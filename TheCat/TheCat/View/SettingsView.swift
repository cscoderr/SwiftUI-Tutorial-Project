//
//  SettingsView.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("App Icons")
                }
                HStack {
                    Text("Light Mode")
                    Spacer()
                    Menu {
                        Button {
                                // do something
                            } label: {
                                Text("System")
                            }
                            Button {
                                // do something
                            } label: {
                                Text("Light Mode")
                            }
                            Button {
                                // do something
                            } label: {
                                Text("Dark Mode")
                            }
                    } label: {
                        Image(systemName: "arrow.up.and.line.horizontal.and.arrow.down")
                            .foregroundColor(.black)
                    }

                }
                Text("Cart1")
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
