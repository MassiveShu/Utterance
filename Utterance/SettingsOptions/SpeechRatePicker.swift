//
//  SpeechRatePicker.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI

struct SpeechRatePicker: View {
    @State private var rateValue = 1.0

    let step = 0.25
    let range = 0.25...2.0

    var body: some View {
        VStack {
            Stepper("Rate: \(String(format: "%.2f", rateValue))",
                    value: $rateValue,
                    in: range,
                    step: step
            )
        }
        .padding(10)
        .font(.headline.bold())
        .background(Color.yellowSW)
        .clipShape(Capsule())
    }
}

struct SpeechRatePicker_Previews: PreviewProvider {
    static var previews: some View {
        SpeechRatePicker()
            .previewLayout(.sizeThatFits)
    }
}
