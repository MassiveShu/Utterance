//
//  OnboardingSecondView.swift
//  Utterance
//
//  Created by Max Shu on 26.12.2022.
//

import SwiftUI

struct OnboardingSecondView: View {
    @ObservedObject private var viewModel = ViewModel()

    var body: some View {
        ZStack {
            OnboardingStarsAnimation()

            VStack {
                Text("The evil lord Darth Vader, obsessed with finding young Skywalker, has dispatched thousands of remote probes across the far reaches of space...")
                    .font(.starWarsFont(.main, size: 22))
                    .foregroundColor(Color.yellowSW)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)

                VStack {
                    Text("Voice acting gender:")
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                    VoiceActingGender(selectedGender: $viewModel.activeGender)

                    Text("Volume:")
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                    VolumeSlider()

                    Text("Rate:")
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                    SpeechRatePicker(selectedRate: $viewModel.activeRate)

                    PitchMultiplierPicker()
                }
                .padding()
                Spacer()
            }
            .padding(.horizontal, 15)
            .padding(50)

            VStack {
                Spacer()
                
                HStack {
                    PlayButton(action: {

                    })
                    .padding(70)
                    StopButton(action: {

                    })
                    .padding(70)
                }
            }
        }
    }
}

struct OnboardingSecondView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSecondView()
    }
}
