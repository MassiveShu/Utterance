//
//  PlayButton.swift
//  Utterance
//
//  Created by Max Shu on 23.12.2022.
//

import SwiftUI
import CoreHaptics

struct PlayButton: View {
    @State private var isPlaying: Bool = true

    var action: () -> Void

    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
            hapticResponse()
        }) {
            Image(systemName: self.isPlaying == true ? "play.circle" : "stop.circle")
                .padding()
        }
        .buttonStyle(PlayButtonStyle())
    }

    func hapticResponse() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        let haptic = UINotificationFeedbackGenerator()
        haptic.notificationOccurred(.success)
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(action: {
            
        })
    }
}
