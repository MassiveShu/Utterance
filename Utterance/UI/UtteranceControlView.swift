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
                        .foregroundColor(.blackWhite)
                    
                    TextField("", text: $viewModel.activeText, axis: .vertical)
                        .font(.starWarsMainFont(size: 22))
                        .foregroundColor(Color.yellowCustom)
                        .textFieldStyle(OvalTextFieldStyle())
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
                        .foregroundColor(.blackWhite)
                    
                    VoicePicker(
                        selectedVoice: $viewModel.selectedVoice,
                        allVoices: viewModel.allVoicesName
                    )
                    
                    Text("Volume:")
                        .font(.body.bold())
                        .foregroundColor(.blackWhite)
                    
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
                
                PlayButton(
                    isPlaying: $viewModel.isPlaying,
                    playAction: viewModel.playPause
                )
                
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
