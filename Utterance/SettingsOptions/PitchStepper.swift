//
//  PitchStepper.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI

struct PitchStepper: View {
//    @State private var pitchValue = 1.0
    @Binding var pitchValue: Float

    let step: Float = 0.5

    var body: some View {
        VStack {
            Stepper("Pitch: \(String(format: "%.1f", pitchValue))",
                    value: $pitchValue,
                    in: 0.5...2.0,
                    step: step
            )
        }
        .padding(10)
        .font(.title3.bold())
        .foregroundColor(.black)
        .background(Color.yellowSW)
        .clipShape(Capsule())
    }
}


struct PitchStepper_Previews: PreviewProvider {
    @State static var pitch: Float = 1

    static var previews: some View {
        PitchStepper(pitchValue: $pitch)
            .previewLayout(.sizeThatFits)
    }
}
