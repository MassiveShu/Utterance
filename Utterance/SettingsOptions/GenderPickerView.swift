//
//  GenderPickerView.swift
//  Utterance
//
//  Created by Max Shu on 09.01.2023.
//

import SwiftUI
import AVFoundation

struct GenderPickerView: View {
    @Binding var selectedVoice: Int
    @Binding var allVoices: [AVSpeechSynthesisVoice]

    var body: some View {
        Picker(selection: $selectedVoice) {
            ForEach(0..<allVoices.count, id: \.self) { voice in
                Text("\(allVoices[voice].name)")
            }
        } label: {
            Text("Utterance")
        }
        .pickerStyle(.wheel)
    }

    struct GenderPickerView_Previews: PreviewProvider {
        @State static var selectedVoice = 23
        @State static var allVoices = AVSpeechSynthesisVoice.speechVoices()

        static var previews: some View {
            GenderPickerView(
                selectedVoice: $selectedVoice,
                allVoices: $allVoices
            )
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        }
    }
}
