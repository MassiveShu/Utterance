//
//  VoiceActingGender.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI
import CoreHaptics

struct VoiceActingGender: View {
    enum Gender: String, Identifiable, CaseIterable {
        case male = "♂︎ Male"
        case female = "⚲ Female"

        var id: String {
            self.rawValue
        }
    }

    private enum Constant {
        static let hStackSpacing: CGFloat = 25
        static let textPadding: CGFloat = 15
    }

    let genders: [Gender] = Gender.allCases
    @Binding var selectedGender: Gender

    var body: some View {
        HStack(spacing: Constant.hStackSpacing) {
            ForEach(genders) { gender in
                let isSelected = gender == selectedGender
                VStack {
                    Text(gender.rawValue)
                        .font(.title3.bold())
                        .padding(Constant.textPadding)
                        .foregroundColor(isSelected ? Color.white : .black)
                        .frame(minWidth: 110)
                        .background(isSelected ? Color.lightBlueSW : .yellowSW)
                        .clipShape(Capsule())
                }
                .onTapGesture(perform: {
                    selectedGender = gender
                    hapticResponse()
                })
            }
        }
        .animation(.interactiveSpring(), value: selectedGender)
    }

    func hapticResponse() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        let haptic = UINotificationFeedbackGenerator()
        haptic.notificationOccurred(.success)
    }
}

struct VoiceActingGender_Previews: PreviewProvider {
    @State static var gender: VoiceActingGender.Gender = .male
    
    static var previews: some View {
        VoiceActingGender(selectedGender: $gender)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
