//
//  PlayButton.swift
//  Utterance
//
//  Created by Max Shu on 23.12.2022.
//

import SwiftUI
import CoreHaptics

struct PlayButton: View {
    @Binding var isPlaying: Bool

    var playAction: () -> Void
    
    let playIcon = "play.circle"
    let stopIcon = "stop.circle"

    var body: some View {
        Button(action: {
            playAction()
            hapticResponse()
        }) {
            Image(systemName: self.isPlaying ? stopIcon : playIcon)
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
        PlayButton(isPlaying: .constant(true), playAction: {
            
        })
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}