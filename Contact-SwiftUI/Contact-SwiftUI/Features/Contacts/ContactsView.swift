//
//  ContactsView.swift
//  Contact-SwiftUI
//
//  Created by Tomiwa Idowu on 15/02/2023.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Label {
                            Text("All Contact")
                        } icon: {
                            Image(systemName: "person.3")
                        }
                        Spacer()
                        Text("335")
                        Image(systemName: "arrow.right")
                    }

                }
                
                Section {
                    HStack {
                        Label {
                            Text("All iCloud")
                        } icon: {
                            Image(systemName: "person.3")
                        }
                        Spacer()
                        Text("335")
                        Image(systemName: "arrow.right")
                        
                    }
                    
                    HStack {
                        Label {
                            Text("Friends")
                        } icon: {
                            Image(systemName: "person.2")
                        }
                        Spacer()
                        Text("0")
                        Image(systemName: "arrow.right")
                        
                    }
                    
                    HStack {
                        Label {
                            Text("Work")
                        } icon: {
                            Image(systemName: "person.2")
                        }
                        Spacer()
                        Text("0")
                        Image(systemName: "arrow.right")
                        
                    }
                }
            header: {
                   Text("iCloud")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .textCase(.none)
                }
                
                Section {
                    HStack {
                        Label {
                            Text("All Gmail")
                        } icon: {
                            Image(systemName: "person.3")
                        }
                        Spacer()
                        Text("123")
                        Image(systemName: "arrow.right")
                        
                    }
                }
            header: {
                   Text("Gmail")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .textCase(.none)                }
                
            }
            .navigationTitle(Text("Lists"))
            .navigationBarItems(leading: Button("Edit", action: {
                
            }), trailing: Button("Add List", action: {
                
            }))
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactsView()
            ContactsView()
                .preferredColorScheme(.dark)
        }
        
    }
}
