//
//  HomeViewModel.swift
//  Zeldopia
//
//  Created by Daniel Bornstedt on 30/03/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {

    @Published var game: Game = .init(success: false, count: 0, data: [])

    private let provider: HomeProvider
    private var gameToken: AnyCancellable?

    init(provider: HomeProvider) {
        self.provider = provider

        gameToken = provider.fetchGames()
            .debugSink { game in
                self.game = game
            }
    }
}
