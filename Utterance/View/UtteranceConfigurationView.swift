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

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Editable text:")
                    .font(.subheadline.bold())
                    .foregroundColor(.white)

                TextField("", text: $viewModel.activeText, axis: .vertical)
                    .font(.starWarsFont(size: 22))
                    .foregroundColor(Color.yellowSW)
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
                    .lineLimit(6...8)
                    .focused($endEditing)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()

                            Button("Done") {
                                endEditing = false
                            }
                        }
                    }

                Text("Voice:")
                    .font(.subheadline.bold())
                    .foregroundColor(.white)

                GenderPickerView(
                    selectedVoice: $viewModel.selectedVoice,
                    allVoices: $viewModel.allVoices
                )

                Text("Volume:")

                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                VolumeSlider(
                    activeVolume: $viewModel.activeVolume
                )

                RateStepper(
                    rateValue: $viewModel.activeRate
                )

                PitchStepper(
                    pitchValue: $viewModel.activePitch
                )
            }
            .padding()

            VStack {
                PlayButton(
                    isPlaying: $viewModel.isPlaying,
                    playAction: viewModel.playPause
                )
            }
            .padding(.bottom, 10)
        }
        .background {
            StarsAnimationView()
        }
        .preferredColorScheme(.dark)
    }
}

struct UtteranceConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        UtteranceConfigurationView()
    }
}
