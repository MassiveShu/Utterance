//
//  PlayButton.swift
//  Utterance
//
//  Created by Max Shu on 23.12.2022.
//

import SwiftUI

struct PlayButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "play.circle")
                .padding()
        }
        .buttonStyle(PlayButtonStyle())
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(action: {
            
        })
    }
}
