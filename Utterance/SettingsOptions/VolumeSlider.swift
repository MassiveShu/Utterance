//
//  VolumeSlider.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI

struct VolumeSlider: View {
    @State private var volumeLevel: Double = 100

    var body: some View {
        VStack {
            Text("Volume: \(volumeLevel, specifier: "%.0f")")
                .font(.subheadline.bold())
                .foregroundColor(.white)
            
            Slider(value: $volumeLevel, in: 0...100)
        }
        .background(Color.black)
        .padding()
    }
}

struct VolumeSlider_Previews: PreviewProvider {
    static var previews: some View {
        VolumeSlider()
    }
}
