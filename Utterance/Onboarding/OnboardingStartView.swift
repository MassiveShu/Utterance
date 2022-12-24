//
//  OnboardingStartView.swift
//  Utterance
//
//  Created by Max Shu on 24.12.2022.
//

import SwiftUI

struct OnboardingStartView: View {

    var body: some View {
        ZStack {
            VStack {
                OnboardingStarsAnimation()
            }
            VStack {
                Text("A long time ago, \nin a galaxy far, far away...")
                    .font(.custom("SfDistantGalaxyOutline", size: 60))
                    .foregroundColor(Color.yellowSW)
                    .padding(.top, 120)
                Spacer()
                SlideToUnlockButtonView()
            }
            .padding(50)
        }
    }
}

struct OnboardingStartView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStartView()
    }
}
