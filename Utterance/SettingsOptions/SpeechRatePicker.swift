//
//  SpeechRatePicker.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI
import CoreHaptics

struct SpeechRatePicker: View {
    enum Rate: String, Identifiable, CaseIterable {
        case lowRate = "0.25"
        case midRate = "0.50"
        case normalRate = "1.0"
        case highRate = "2.0"

        var id: String {
            self.rawValue
        }
    }

    private enum Constant {
        static let hStackSpacing: CGFloat = 25
        static let textPadding: CGFloat = 15
    }

    let rates: [Rate] = Rate.allCases
    @Binding var selectedRate: Rate

    var body: some View {
        HStack(spacing: Constant.hStackSpacing) {
            ForEach(rates) { rate in
                let isSelected = rate == selectedRate
                VStack {
                    Text(rate.rawValue)
                        .font(.headline.bold())
                        .padding(Constant.textPadding)
                        .foregroundColor(isSelected ? Color.white : .black)
                        .background(isSelected ? Color.lightBlueSW : .yellowSW)
                        .clipShape(Circle())
                }
                .onTapGesture(perform: {
                    selectedRate = rate
                    hapticResponse()
                })
            }
        }
        .animation(.interactiveSpring(), value: selectedRate)
    }

    func hapticResponse() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        let haptic = UINotificationFeedbackGenerator()
        haptic.notificationOccurred(.success)
    }
}

struct SpeechRatePicker_Previews: PreviewProvider {
    @State static var rate: SpeechRatePicker.Rate = .normalRate
    
    static var previews: some View {
        SpeechRatePicker(selectedRate: $rate)
            .previewLayout(.sizeThatFits)
    }
}
