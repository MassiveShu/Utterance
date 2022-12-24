//
//  SetupButtonStyle.swift
//  Utterance
//
//  Created by Max Shu on 23.12.2022.
//

import SwiftUI

struct SetupButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2.bold())
            .background(configuration.isPressed ? Color.yellow : .blue)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
