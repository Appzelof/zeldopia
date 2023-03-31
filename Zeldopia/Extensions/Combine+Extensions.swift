//
//  Combine+Extensions.swift
//  Zeldopia
//
//  Created by Daniel Bornstedt on 30/03/2023.
//

import Foundation
import Combine

extension Publisher {
    func debugSink( _ value: @escaping (Output) -> Void) -> AnyCancellable {
        sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    debugPrint("🛀: sink completed")
                case .failure(let error):
                    debugPrint("💥:", error)
                }
            },
            receiveValue: value
        )
    }
}
