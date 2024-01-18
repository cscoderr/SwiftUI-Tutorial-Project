//
//  CoinDetailsView.swift
//  NetworkingTutorial
//
//  Created by Tomiwa Idowu on 1/17/24.
//

import SwiftUI

struct CoinDetailsView: View {
    var coin: Coin
    
    var body: some View {
        List {
            AsyncImage(url: URL(string: coin.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            
            Section {
                LabeledContent("Name", value: coin.name.capitalized)
                LabeledContent("Symbol", value: coin.symbol.uppercased())
                LabeledContent("Current Price") {
                    Text(coin.currentPrice, format: .currency(code: "USD"))
                }
            }
        }
    }
}
