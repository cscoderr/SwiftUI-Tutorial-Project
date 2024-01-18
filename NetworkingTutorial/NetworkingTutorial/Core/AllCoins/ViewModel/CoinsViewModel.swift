//
//  CoinsViewModel.swift
//  NetworkingTutorial
//
//  Created by Tomiwa Idowu on 1/17/24.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        Task {
            await fetchCoins()
        }
    }
    
    func fetchCoins() async {
        let result = await service.fetchCoins()
        
        DispatchQueue.main.async {
            switch result {
                case let .success(coins):
                    self.coins = coins
                case let .failure(error):
                    self.errorMessage = error.customDescription
            }
        }
    }
    
    func fetchCoinsWithCompletionHandler() {
//        service.fetchCoins { coins, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    self.errorMessage = error.localizedDescription
//                }
//                self.coins = coins ?? []
//            }
//        }
        service.fetchCoinsWithResult { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let coins):
                        self?.coins = coins
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
