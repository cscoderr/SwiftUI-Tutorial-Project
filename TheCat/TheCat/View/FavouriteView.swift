//
//  FavouriteView.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false){
                ForEach(1..<9) { _ in
                    HStack(spacing: 20) {
                        Rectangle().frame( height: 150)
                        Rectangle().frame( height: 150)
                    }
                }
            }
            .padding(.horizontal, 20)
                .navigationTitle("Favourites")
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
