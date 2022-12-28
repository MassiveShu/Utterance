//
//  UtteranceConfigurationView.swift
//  Utterance
//
//  Created by Max Shu on 26.12.2022.
//

import SwiftUI

struct UtteranceConfigurationView: View {
    @ObservedObject private var viewModel = ViewModel()

    let playAction: () -> Void

    var body: some View {
        ZStack {
            StarsAnimationView()

            VStack {
                Text(viewModel.activeText)
                    .font(.starWarsFont(size: 22))
                    .foregroundColor(Color.yellowSW)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)

                VStack(spacing: 25) {
                    Text("Voice acting gender:")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    VoiceActingGender(selectedGender: $viewModel.activeGender)

                    Text("Volume:")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    VolumeSlider(activeVolume: $viewModel.activeVolume)

                    RateStepper()

                    PitchStepper()
                }
                .padding()
                Spacer()
            }
            .padding(50)

            VStack {
                Spacer()
                
                PlayButton(action: playAction)
            }
            .padding(.bottom, 25)
        }
    }
}

struct UtteranceConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        UtteranceConfigurationView(playAction: {
            
        })
    }
}
