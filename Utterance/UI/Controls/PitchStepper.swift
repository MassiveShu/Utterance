//
//  PitchStepper.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI
import CoreHaptics

struct PitchStepper: View {
    @Binding var pitchValue: Double
    @State private var engine: CHHapticEngine?

    private let range: ClosedRange<Double> = 0.5...2.0
    private let step: Double = 0.5
    
    var body: some View {
        Stepper("Pitch: \(String(format: "%.1f", pitchValue))",
                value: $pitchValue,
                in: range,
                step: step
        )
        
        .padding(10)
        .font(.title3.bold())
        .foregroundColor(.black)
        .background(Color.yellowCustom)
        .clipShape(Capsule())
        .onAppear(perform: prepareHaptics)
        .onChange(of: pitchValue) { value in
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


struct PitchStepper_Previews: PreviewProvider {
    @State static var pitchValue: Double = 1
    
    static var previews: some View {
        PitchStepper(pitchValue: $pitchValue)
            .previewLayout(.sizeThatFits)
    }
}
