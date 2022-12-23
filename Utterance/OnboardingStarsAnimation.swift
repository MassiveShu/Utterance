//
//  OnboardingStarsAnimation.swift
//  Utterance
//
//  Created by Max Shu on 23.12.2022.
//

import SwiftUI

struct OnboardingStarsAnimation: View {
    @State private var runAnimation = false
    var body: some View {
        ZStack {
            // create a black background with no edges ignoredSafeArea
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                ForEach(0..<10) { _ in
                    HStack {
                        ForEach(0..<5) { _ in
                            Circle().fill(Color.white)
                            // size of stars
                                .frame(width: 3, height: 2)
                                .blur(radius: runAnimation ? 1 : 0)
                            // animate stars
                                .animation(Animation.easeInOut(duration: 13).repeatForever())
                                .padding(EdgeInsets(
                                    top: self.random(),
                                    leading: 0,
                                    bottom: 0,
                                    trailing: self.random())
                                )
                                .onAppear() {
                                    self.runAnimation = true
                                }
                        }
                    }
                }
            }
        }
    }

    func random() -> CGFloat {
        return CGFloat(Int.random(in: 20..<130))
    }
}

struct OnboardingStarsAnimation_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStarsAnimation()
    }
}
