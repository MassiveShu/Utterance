//
//  PitchMultiplierPicker.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI

struct PitchMultiplierPicker: View {
    @State private var selectedPitch = 1
    private var pitchOptions = ["0.5", "1.0", "1.5", "2.0"]

    var body: some View {
//        VStack {
//            Text("Pitch:")
//                .font(.subheadline.bold())
//                .foregroundColor(.white)

            Picker("", selection: $selectedPitch) {
                ForEach(0..<pitchOptions.count, id: \.self) {
                    Text(self.pitchOptions[$0])
                        .foregroundColor(Color.black)
                }
            }
            .pickerStyle(.segmented)
            .onAppear {
                UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
                UISegmentedControl.appearance().backgroundColor = UIColor(Color.yellowSW)
                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.lightBlueSW)
            }
        }
//        .background(Color.black)
//        .padding()
//    }
}

struct PitchMultiplierPicker_Previews: PreviewProvider {
    static var previews: some View {
        PitchMultiplierPicker()
            .previewLayout(.sizeThatFits)
    }
}
