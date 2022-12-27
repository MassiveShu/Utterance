//
//  PitchMultiplierPicker.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI
import CoreHaptics

struct PitchMultiplierPicker: View {
    enum Pitch: String, Identifiable, CaseIterable {
        case lowPitch = "0.5"
        case normalPitch = "1.0"
        case midPitch = "1.5"
        case highPitch = "2.0"

        var id: String {
            self.rawValue
        }
    }

    private enum Constant {
        static let hStackSpacing: CGFloat = 25
        static let textPadding: CGFloat = 15
    }

    let pitches: [Pitch] = Pitch.allCases
    @Binding var selectedPitch: Pitch

    var body: some View {
        HStack(spacing: Constant.hStackSpacing) {
            ForEach(pitches) { pitch in
                let isSelected = pitch == selectedPitch
                VStack {
                    Text(pitch.rawValue)
                        .font(.headline.bold())
                        .padding(Constant.textPadding)
                        .foregroundColor(isSelected ? Color.white : .black)
                        .background(isSelected ? Color.lightBlueSW : .yellowSW)
                        .clipShape(Circle())
                }
                .onTapGesture(perform: {
                    selectedPitch = pitch
                    hapticResponse()
                })
            }
        }
        .animation(.interactiveSpring(), value: selectedPitch)
    }

    func hapticResponse() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        let haptic = UINotificationFeedbackGenerator()
        haptic.notificationOccurred(.success)
    }
}

struct PitchMultiplierPicker_Previews: PreviewProvider {
    @State static var pitch: PitchMultiplierPicker.Pitch = .normalPitch

    static var previews: some View {
        PitchMultiplierPicker(selectedPitch: $pitch)
            .previewLayout(.sizeThatFits)
    }
}
