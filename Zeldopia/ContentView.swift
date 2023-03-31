//
//  ContentView.swift
//  Zeldopia
//
//  Created by Daniel Bornstedt on 30/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home(viewModel: HomeViewModel(provider: HomeProviderImpl()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
