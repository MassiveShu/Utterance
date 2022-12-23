//
//  PlayButtonStyle.swift
//  Utterance
//
//  Created by Max Shu on 23.12.2022.
//

import SwiftUI

struct PlayButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle.bold())
            .background(configuration.isPressed ? Color.yellow : .blue)
            .foregroundColor(Color.white)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}
