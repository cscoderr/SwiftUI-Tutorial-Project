//
//  FavouriteView.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import SwiftUI

struct FavouriteView: View {
    @FetchRequest(sortDescriptors: []) var likes: FetchedResults<Likes>
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                ]) {
                    ForEach(likes, id: \.self) { like in
                        GridRow {
                            VStack {
                                AsyncImage(url: .init(string: like.imageUrl ?? "https://cdn2.thecatapi.com/images/7CGV6WVXq.jpg")) {
                                    image in
                                    
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 160, height: 160)
                                        .background(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                Text(like.name ?? "Unknown")
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
//            List(likes) { favourite in
//
//            }
             .navigationTitle("Favourites")
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
