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
    @State private var engine: CHHapticEngine?

    var playAction: () -> Void
    
    let playIcon = "play.circle"
    let stopIcon = "stop.circle"

    var body: some View {
        Button(action: {
            playAction()
            hapticsSuccess()
        }) {
            Image(systemName: self.isPlaying ? stopIcon : playIcon)
                .padding()
        }
        .buttonStyle(PlayButtonStyle())
        .onAppear(perform: prepareHaptics)
    }

    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Error with creating the engine: \(error.localizedDescription)")
        }
    }

    func hapticsSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)

        do {
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(isPlaying: .constant(false), playAction: {
            
        })
        .previewLayout(.sizeThatFits)
    }
}
