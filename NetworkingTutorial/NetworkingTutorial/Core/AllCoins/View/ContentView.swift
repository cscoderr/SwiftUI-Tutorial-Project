//
//  ContentView.swift
//  NetworkingTutorial
//
//  Created by Tomiwa Idowu on 1/17/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coin in
                    NavigationLink(value: coin) {
                        CoinItemView(coin: coin)
                    }

                }
            }
            .navigationTitle("Coins")
            .navigationDestination(for: Coin.self) { coin in
                CoinDetailsView(coin: coin)
            }
            .overlay {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct CoinItemView: View {
    var coin: Coin
    var body: some View {
        HStack(spacing: 12) {
            Text("\(coin.marketCapRank)")
                .foregroundStyle(.gray)
            
            AsyncImage(url: URL(string: coin.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 30, height: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .fontWeight(.semibold)
                
                Text(coin.symbol.uppercased())
            }
        }
        .font(.footnote)
    }
}
