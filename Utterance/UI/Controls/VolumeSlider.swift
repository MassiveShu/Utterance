//
//  VolumeSlider.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI

struct VolumeSlider: View {
    @Binding var activeVolume: Double
    
    private let range: ClosedRange<Double> = 0...1
    private let step: Double = 0.1
    
    var body: some View {
        Slider(
            value: $activeVolume,
            in: range,
            step: step
        )
        .accentColor(.yellowCustom)
    }
}

struct VolumeSlider_Previews: PreviewProvider {
    @State static var activeVolume: Double = 0.3
    
    static var previews: some View {
        VolumeSlider(activeVolume: $activeVolume)
            .previewLayout(.sizeThatFits)
    }
}
