//
//  HomeProviderImpl.swift
//  Zeldopia
//
//  Created by Daniel Bornstedt on 30/03/2023.
//

import Foundation
import Combine

class HomeProviderImpl: HomeProvider {

    private let url = URL(string: "https://zelda.fanapis.com/api/games")!

    private var gameToken: AnyCancellable?

    func fetchGames() -> any Publisher<Game, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Game.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
    }
}
