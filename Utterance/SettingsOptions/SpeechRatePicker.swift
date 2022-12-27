//
//  SpeechRatePicker.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI

struct SpeechRatePicker: View {
    @State private var selectedRate = 2
    private var rateOptions = ["0.25", "0.50", "1.0", "2.0"]

    var body: some View {
        VStack {
            Text("Rate:")
                .font(.subheadline.bold())
                .foregroundColor(.white)

            Picker("", selection: $selectedRate) {
                ForEach(0..<rateOptions.count, id: \.self) {
                    Text(self.rateOptions[$0])
                }
            }
            .pickerStyle(.segmented)
        }
        .onAppear {
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            UISegmentedControl.appearance().backgroundColor = UIColor(Color.yellowSW)
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.lightBlueSW)
        }
        .background(Color.black)
        .padding()
    }
}

struct SpeechRatePicker_Previews: PreviewProvider {
    static var previews: some View {
        SpeechRatePicker()
    }
}
