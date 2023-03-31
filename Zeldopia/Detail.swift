//
//  DetailView.swift
//  Zeldopia
//
//  Created by Daniel Bornstedt on 30/03/2023.
//

import Foundation
import SwiftUI

struct Detail: View {

    let gameData: GameData

    var body: some View {
        List {
            sectionLabel(
                content: gameData.description,
                header: { Text("") }
            )
            sectionLabel(
                content: gameData.developer,
                header: { Text("Developer") }
            )
            sectionLabel(
                content: gameData.publisher,
                header: { Text("Publisher") }
            )
            sectionLabel(
                content: gameData.releasedDate,
                header: { Text("Release date") }
            )
        }
        .font(.body)
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .navigationTitle(gameData.name)
    }

    private func textLabel(_ verbatim: String) -> Text {
        Text(verbatim)
            .font(.callout)
    }

    private func sectionLabel(
        content: String,
        header: () -> Text
    ) -> Section<Text, Text, EmptyView>? {

        // return nothing if content is empty
        return content.isEmpty
            ? nil
            : Section(content: { Text(content) }, header: header)
    }
}
