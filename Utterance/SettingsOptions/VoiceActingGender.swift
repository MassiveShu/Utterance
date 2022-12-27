//
//  VoiceActingGender.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import SwiftUI

struct VoiceActingGender: View {
    @State private var selectedGender: Int = 0
    private var genderOptions = ["🙋‍♂️Male", "🙋‍♀️Feemale"]
    
    var body: some View {
        VStack {
            Text("Voice acting gender:")
                .font(.subheadline)
                .foregroundColor(.white)

            Picker("", selection: $selectedGender) {
                ForEach(0..<genderOptions.count, id: \.self) {
                    Text(self.genderOptions[$0])
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

struct VoiceActingGender_Previews: PreviewProvider {
    static var previews: some View {
        VoiceActingGender()
    }
}
