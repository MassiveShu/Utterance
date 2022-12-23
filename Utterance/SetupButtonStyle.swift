//
//  SetupButtonStyle.swift
//  Utterance
//
//  Created by Max Shu on 23.12.2022.
//

import SwiftUI

struct SetupButtonStyle: ButtonStyle {
    @State private var didTap: Bool = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2.bold())
            .frame(width: 300, height: 70)
            .background(configuration.isPressed ? Color.yellow : .blue)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
