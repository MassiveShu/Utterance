//
//  VolumeSlider.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI
import CoreHaptics

struct VolumeSlider: View {
    @Binding var activeVolume: Double
    @State private var engine: CHHapticEngine?
    
    private let range: ClosedRange<Double> = 0...1
    private let step: Double = 0.1
    
    var body: some View {
        Slider(
            value: $activeVolume,
            in: range,
            step: step
        )
        .accentColor(.yellowCustom)
        .onAppear(perform: prepareHaptics)
        .onChange(of: activeVolume) { value in
            hapticsSuccess()
        }
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

struct VolumeSlider_Previews: PreviewProvider {
    @State static var activeVolume: Double = 0.3
    
    static var previews: some View {
        VolumeSlider(activeVolume: $activeVolume)
            .previewLayout(.sizeThatFits)
    }
}
