//
//  Home.swift
//  Zeldopia
//
//  Created by Daniel Bornstedt on 30/03/2023.
//

import SwiftUI
import Combine

protocol HomeProvider {
    func fetchGames() -> any Publisher<Game, Error>
}

struct Home: View {
    @StateObject
    private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    private let navigationTitle = "Games"

    var body: some View {
        NavigationStack {
            List {
                Section(navigationTitle) {
                    ForEach(viewModel.game.data) { data in
                        HStack {
                            Image(systemName: "gamecontroller")
                            NavigationLink(data.name, value: data)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle(navigationTitle)
            .navigationDestination(for: GameData.self) { gameData in
                Detail(gameData: gameData)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(viewModel: HomeViewModel(provider: HomeProviderImpl()))
    }
}
