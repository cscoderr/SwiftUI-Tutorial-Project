//
//  HomeView.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(1..<5) { value in
                    CatListItem()
                        .padding(.vertical, 15)
                }
            }
            .padding()
            .navigationTitle("Cats")
            .navigationBarItems(trailing: Image(systemName: "person.circle"))
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CatListItem: View {
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
            VStack {
                Text("My Car")
                Text("Breed")
            }
            Spacer()
            Image(systemName: "heart")
        }
    }
}
