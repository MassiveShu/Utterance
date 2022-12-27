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
            .background(configuration.isPressed ? Color.lightBlueSW : .lightBlueSW)
            .foregroundColor(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
