//
//  UtteranceControlView.swift
//  Utterance
//
//  Created by Max Shu on 26.12.2022.
//

import SwiftUI

struct UtteranceControlView: View {
    @ObservedObject private var viewModel = UtteranceViewModel()
    @FocusState private var endEditing: Bool

    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Editable text:")
                        .font(.body.bold())
                        .foregroundColor(.white)

                    TextField("", text: $viewModel.activeText, axis: .vertical)
                        .font(.starWarsFont(size: 22))
                        .foregroundColor(Color.yellowStarWars)
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
                        .font(.body.bold())
                        .foregroundColor(.white)

                    VoicePicker(
                        selectedVoice: $viewModel.selectedVoice,
                        allVoices: viewModel.allVoicesName
                    )

                    Text("Volume:")
                        .font(.body.bold())
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
                .padding(.top, 50)
            }
            .background {
                StarsAnimationView()
            }
        }
    }
}

struct UtteranceControlView_Previews: PreviewProvider {
    static var previews: some View {
        UtteranceControlView()
    }
}
