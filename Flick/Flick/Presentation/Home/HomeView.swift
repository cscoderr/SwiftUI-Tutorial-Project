//
//  HomeView.swift
//  Flick
//
//  Created by Tomiwa Idowu on 1/6/24.
//

import SwiftUI

struct HomeView: View {
    @State private var currentTab = 0
    @State private var showNotification = false
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<20, id: \.self) { index in
                        Image("Placeholder")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 120, height: 200)
                            .scaledToFit()
                            .shadow(radius: 10)
                        
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("Home")
        .toolbar {
            ToolbarItem {
                Button {
                    showNotification.toggle()
                } label: {
                    Image(systemName: "bell")
                        .fontWeight(.semibold)
                        .imageScale(.medium)
                        .foregroundColor(.white.opacity(0.9))
                }
                .buttonStyle(.borderedProminent)
                .clipShape(Circle())
                .shadow(radius: 2.5)
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
                    .overlay {
                        
                    }
            }
        }
        .sheet(isPresented: $showNotification) {
            NavigationStack {
                Text("No Notifications Available")
                    .navigationTitle("Notifications")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                
                            } label: {
                                Text("Done")
                            }
                        }
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape")
                            }
                        }
                        
                    }
            }
            
        }
       
    }
}

#Preview {
    HomeView()
}
