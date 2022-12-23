//
//  SetupButton.swift
//  Utterance
//
//  Created by Max Shu on 23.12.2022.
//

import SwiftUI

struct SetupButton: View {
    let action: () -> Void

    var body: some View {
        Button("Setup", action: action)
            .buttonStyle(SetupButtonStyle())
    }
}

struct SetupButton_Previews: PreviewProvider {
    static var previews: some View {
        SetupButton(action: {

        })
    }
}
