//
//  Game.swift
//  Zeldopia
//
//  Created by Daniel Bornstedt on 30/03/2023.
//

import Foundation

struct Game: Decodable {
    let success: Bool
    let count: Int
    let data: [GameData]
}

struct GameData: Decodable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
    let developer: String
    let publisher: String
    let releasedDate: String
}

extension Game: Hashable {
    static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.data == rhs.data
    }
}

extension GameData {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        developer = try container.decode(String.self, forKey: .developer)
        publisher = try container.decode(String.self, forKey: .publisher)
        releasedDate = try container.decode(String.self, forKey: .releaseDate)
    }

    private enum CodingKeys: String, CodingKey {
        case id, name, description, developer, publisher
        case releaseDate = "released_date"
    }
}
