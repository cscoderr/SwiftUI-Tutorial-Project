//
//  CatListItemView.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 20/01/2023.
//

import SwiftUI

struct CatListItemView: View {
    let isFavourite: Bool
    let cat: Cat
    var str: String {
        cat.breeds.first?.description ?? ""
    }
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: .init(string: cat.url)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame( width: 70, height: 70)
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous))
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                if let firstName = cat.breeds.first?.name {
                    Text(firstName)
                        .font(.system(.title2, weight: .bold))
                } else  {
                    Text("")
                        .font(.system(.title2, weight: .bold))
                        .redacted(reason: .placeholder)
                }
                
                if let temp = cat.breeds.first?.temperament {
                    Text(temp)
                        .font(.body)
                } else {
                    Text("")
                        .font(.body)
                        .redacted(reason: .placeholder)
                }
                   
                
            }
            .padding(.leading, 5)
            Spacer()
            
            Image(systemName: isFavourite ? "heart.fill" : "heart")
            
        }
        .padding()
//
        
    }
}

struct CatListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CatListItemView(
            isFavourite: false,
            cat: Cat(
                id: "UhqCZ7tC4",
                url: "https://cdn2.thecatapi.com/images/UhqCZ7tC4.jpg",
                width: 200,
                height: 200,
                breeds: [
                    Breed(
                        id: "beng",
                        name: "Bengal",
                        description: "Hi Bengal",
                        temperament: "Alert, Agile, Energetic, Demanding, Intelligent"
                    )
                ]
            )
        )
    }
}
