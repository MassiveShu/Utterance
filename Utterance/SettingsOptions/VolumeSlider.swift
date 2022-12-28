//
//  VolumeSlider.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI
import CoreHaptics

struct VolumeSlider: View {
    @Binding var activeVolume: Float

    var body: some View {
        Slider(value: $activeVolume, in: 0...1)
    }
}

struct VolumeSlider_Previews: PreviewProvider {
    @State static var volume: Float = 1

    static var previews: some View {
        VolumeSlider(activeVolume: $volume)
            .previewLayout(.sizeThatFits)
    }
}
