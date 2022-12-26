//
//  OnboardingStartView.swift
//  Utterance
//
//  Created by Max Shu on 24.12.2022.
//

import SwiftUI

struct OnboardingStartView: View {
    @State private var isLocked = false

    var body: some View {
        NavigationStack {
            ZStack {
                    OnboardingStarsAnimation()
                VStack {
                    Spacer()

                    Text("A long time ago, \nin a galaxy far, far away...")
                        .font(.starWarsFont(.main, size: 60))
                        .foregroundColor(Color.yellowSW)

                    Spacer()

                    SlideToUnlockButtonView(action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            isLocked = true
                        }
                    })
                    .navigationDestination(isPresented: $isLocked) {
                        OnboardingSecondView()
                    }
                }
                .padding(50)
            }
        }
    }
}

struct OnboardingStartView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStartView()
    }
}
