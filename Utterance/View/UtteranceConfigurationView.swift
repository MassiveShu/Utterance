//
//  UtteranceConfigurationView.swift
//  Utterance
//
//  Created by Max Shu on 26.12.2022.
//

import SwiftUI

struct UtteranceConfigurationView: View {
    @ObservedObject private var viewModel = ViewModel()

    @FocusState private var endEditing: Bool

    let playAction: () -> Void

    var body: some View {
        ZStack {
            StarsAnimationView()

            VStack {
                TextField("", text: $viewModel.activeText, axis: .vertical)
                    .font(.starWarsFont(size: 22))
                    .foregroundColor(Color.yellowSW)
                    .lineSpacing(5)
                    .lineLimit(8...10)
                    .focused($endEditing)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()

                            Button("Done") {
                                endEditing = false
                            }
                        }
                    }

                Text("Voice acting gender:")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                VoiceActingGender(selectedGender: $viewModel.activeGender)

                Text("Volume:")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                VolumeSlider(activeVolume: $viewModel.activeVolume)

                RateStepper(rateValue: $viewModel.activeRate)

                PitchStepper(pitchValue: $viewModel.activePitch)

                Spacer()

                PlayButton(action: playAction)
            }
            .padding(50)
        }
    }
}

struct UtteranceConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        UtteranceConfigurationView(playAction: {
            
        })
    }
}
