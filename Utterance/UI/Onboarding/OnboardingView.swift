//
//  OnboardingView.swift
//  Utterance
//
//  Created by Max Shu on 24.12.2022.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isLocked = false

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        Text("A long time ago, in a galaxy far, far away...")
                            .font(.starWarsFont(size: 50))
                            .foregroundColor(Color.yellowBlue)
                    }
                    .padding(.top, 70)
                }

                SlideToUnlockButton(action: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        isLocked = true
                    }
                })
                .navigationDestination(isPresented: $isLocked) {
                    UtteranceControlView()
                }
            }
            .padding(50)
            .background {
                StarsAnimationView()
            }
        }
    }
}

struct OnboardingtView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
