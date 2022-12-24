//
//  StopButton.swift
//  Utterance
//
//  Created by Max Shu on 23.12.2022.
//

import SwiftUI

struct StopButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "stop.circle")
                .padding()
        }
        .buttonStyle(StopButtonStyle())
    }
}

struct StopButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            StopButton(action: {
            })
            .padding()
        }
    }
}
