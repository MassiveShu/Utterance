//
//  PitchStepper.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI

struct PitchStepper: View {
    @Binding var pitchValue: Double

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
    }
}


struct PitchStepper_Previews: PreviewProvider {
    @State static var pitchValue: Double = 1
    
    static var previews: some View {
        PitchStepper(pitchValue: $pitchValue)
            .previewLayout(.sizeThatFits)
    }
}
