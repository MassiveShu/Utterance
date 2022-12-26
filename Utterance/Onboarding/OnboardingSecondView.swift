//
//  OnboardingSecondView.swift
//  Utterance
//
//  Created by Max Shu on 26.12.2022.
//

import SwiftUI

struct OnboardingSecondView: View {
    var body: some View {
        ZStack {
            OnboardingStarsAnimation()

            VStack {
                Spacer()

                Text("The evil lord Darth Vader, obsessed with finding young Skywalker, has dispatched thousands of remote probes across the far reaches of space...")
                    .font(.starWarsFont(.main, size: 30))
                    .foregroundColor(Color.yellowSW)

                Spacer()
            }
            .padding(50)
        }
    }
}

struct OnboardingSecondView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSecondView()
    }
}
