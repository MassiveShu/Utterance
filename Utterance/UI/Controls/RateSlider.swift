//
//  RateSlider.swift
//  Utterance
//
//  Created by Max Shu on 21.01.2023.
//

import SwiftUI


struct RateSlider: View {
    @Binding var rateValue: Double
    
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
    }
}

struct RateSlider_Previews: PreviewProvider {
    @State static var rateValue: Double = 0.5
    
    static var previews: some View {
        RateSlider(rateValue: $rateValue)
            .previewLayout(.sizeThatFits)
    }
}
