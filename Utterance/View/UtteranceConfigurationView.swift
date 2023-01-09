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
        ZStack {
            StarsAnimationView()
            
            VStack {
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
                
                Text("Voice acting gender:")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                VoiceActingGender(selectedGender: $viewModel.activeGender)
                
                Text("Current Volume:")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                VolumeSlider(activeVolume: $viewModel.activeVolume)
                
                RateStepper(rateValue: $viewModel.activeRate)
                
                PitchStepper(pitchValue: $viewModel.activePitch)
                
                Spacer()
                
                PlayButton(isPlaying: $viewModel.isPlaying, playAction: viewModel.playPause)
            }
            .padding(50)
        }
    }
}

struct UtteranceConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        UtteranceConfigurationView()
    }
}
