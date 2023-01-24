//
//  RateSlider.swift
//  Utterance
//
//  Created by Max Shu on 21.01.2023.
//

import SwiftUI
import CoreHaptics


struct RateSlider: View {
    @Binding var rateValue: Double
    @State private var engine: CHHapticEngine?
    
    private let range: ClosedRange<Double> = 0.25...1.0
    private let max: Float = 1.0
    private let step: Double = 0.25
    
    var body: some View {
        VStack(spacing: 0) {
            Slider(
                value: $rateValue,
                in: range,
                step: step
            )
            .onChange(of: rateValue) { value in
                hapticsSuccess()
            }
            .accentColor(.yellowCustom)
            
            HStack(spacing: 0) {
                ForEach(0..<4) { index in
                    VStack {
                        Text("I")
                    }
                    if index != 3 {
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 10)
        }
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

struct RateSlider_Previews: PreviewProvider {
    @State static var rateValue: Double = 0.5
    
    static var previews: some View {
        RateSlider(rateValue: $rateValue)
            .previewLayout(.sizeThatFits)
    }
}
