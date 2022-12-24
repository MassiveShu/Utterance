//
//  UnlockButtonStyle.swift
//  Utterance
//
//  Created by Max Shu on 21.12.2022.
//

import SwiftUI

struct UnlockButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
}
