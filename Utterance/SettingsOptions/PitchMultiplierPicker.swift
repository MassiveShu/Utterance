//
//  PitchMultiplierPicker.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI

struct PitchMultiplierPicker: View {
    @State private var pitchValue = 1.0

    let step = 0.5
    let range = 0.5...2.0

    var body: some View {
        VStack {
            Stepper("Pitch: \(String(format: "%.1f", pitchValue))",
                    value: $pitchValue,
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


struct PitchMultiplierPicker_Previews: PreviewProvider {
    static var previews: some View {
        PitchMultiplierPicker()
            .previewLayout(.sizeThatFits)
    }
}
