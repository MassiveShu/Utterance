//
//  VolumeSlider.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI
import CoreHaptics

struct VolumeSlider: View {
    @State private var volumeLevel: Float = 100
    
    var body: some View {
        Slider(value: $volumeLevel, in: 0...100)
    }
}

struct VolumeSlider_Previews: PreviewProvider {
    static var previews: some View {
        VolumeSlider()
            .previewLayout(.sizeThatFits)
    }
}
