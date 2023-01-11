//
//  VolumeSlider.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI
import CoreHaptics
import MediaPlayer

struct VolumeSlider: View {
    @Binding var activeVolume: Float
    
    private let range: ClosedRange<Float> = 0...1
    private let step: Float = 0.1
    
    var body: some View {
        Slider(
            value: $activeVolume,
            in: range,
            step: step
        )
    }
}

struct VolumeSlider_Previews: PreviewProvider {
    @State static var volume: Float = 1
    
    static var previews: some View {
        VolumeSlider(activeVolume: $volume)
            .previewLayout(.sizeThatFits)
    }
}


