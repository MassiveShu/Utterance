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
                Text("The evil lord Darth Vader, obsessed with finding young Skywalker, has dispatched thousands of remote probes across the far reaches of space...")
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
                    VolumeSlider()

                    RateStepper()

                    PitchStepper()
                }
                .padding()
                Spacer()
            }
            .padding(50)

            VStack {
                Spacer()
                
                HStack {
                    PlayButton(action: playAction)
                    .padding(70)
                    StopButton(action: {

                    })
                    .padding(70)
                }
            }
        }
    }
}

struct UtteranceConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        UtteranceConfigurationView(playAction: {
            
        })
    }
}
