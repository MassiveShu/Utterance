//
//  RateStepper.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI

struct RateStepper: View {
    @Binding var rateValue: Float
    
    let step: Float = 0.25
    
    var body: some View {
        Stepper("Rate: \(String(format: "%.2f", rateValue))x",
                value: $rateValue,
                in: 0.25...2.0,
                step: step
        )
        .padding(10)
        .font(.title3.bold())
        .foregroundColor(.black)
        .background(Color.yellowSW)
        .clipShape(Capsule())
    }
}

struct RateStepper_Previews: PreviewProvider {
    @State static var rate: Float = 1.0
    
    static var previews: some View {
        RateStepper(rateValue: $rate)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
