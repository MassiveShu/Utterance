//
//  VoicePicker.swift
//  Utterance
//
//  Created by Max Shu on 09.01.2023.
//

import SwiftUI

struct VoicePicker: View {
    @Binding var selectedVoice: String
    let allVoices: [String]
    
    var body: some View {
        Picker(selection: $selectedVoice) {
            ForEach(allVoices, id: \.self) { voice in
                Text("\(voice)")
            }
            .foregroundColor(.blackWhite)
        } label: {
            Text("Utterance")
        }
        .pickerStyle(.wheel)
    }
    
    struct VoicePicker_Previews: PreviewProvider {
        @State static var selectedVoice = "voice1"
        static let allVoices = ["voice1", "Voice2", "voice3"]
        
        static var previews: some View {
            VoicePicker(
                selectedVoice: $selectedVoice,
                allVoices: allVoices
            )
            .previewLayout(.sizeThatFits)
        }
    }
}
