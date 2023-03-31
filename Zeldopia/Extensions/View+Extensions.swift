//
//  View+Extensions.swift
//  Zeldopia
//
//  Created by Daniel Bornstedt on 30/03/2023.
//

import Foundation
import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
