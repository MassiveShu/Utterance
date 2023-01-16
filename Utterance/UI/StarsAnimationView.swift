//
//  StarsAnimationView.swift
//  Utterance
//
//  Created by Max Shu on 23.12.2022.
//

import SwiftUI

struct StarsAnimationView: View {
    private enum Constant {
        static let numberOfStars = 0..<5
        static let linesOfStars = 0..<10
    }
    
    @State private var runAnimation = false
    
    var body: some View {
        ZStack {
            Color.whiteBlack.edgesIgnoringSafeArea(.all)
            
            VStack {
                ForEach(Constant.linesOfStars, id: \.self) { _ in
                    HStack {
                        ForEach(Constant.numberOfStars, id: \.self) { _ in
                            Circle()
                                .fill(Color.blackWhite)
                                .frame(width: 3, height: 2)
                                .blur(radius: runAnimation ? 1 : 0)
                                .padding(randonInsets)
                                .onAppear {
                                    withAnimation(easeOutAnimation) {
                                        self.runAnimation = true
                                    }
                                }
                        }
                    }
                }
            }
            .overlay(overlayGradient)
            .navigationBarBackButtonHidden(true)
        }
    }

    private var easeOutAnimation = Animation
        .easeOut(duration: 13)
        .repeatForever()

    private var randonInsets: EdgeInsets {
        EdgeInsets(
            top: self.randomPadding(),
            leading: 0,
            bottom: 0,
            trailing: self.randomPadding()
        )
    }
    
    private var overlayGradient: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.lightBlue, .whiteBlack]),
                    startPoint: .top,
                    endPoint: .center
                )
                .opacity(0.4)
            )
    }

    private func randomPadding() -> CGFloat {
        CGFloat(Int.random(in: 20..<150))
    }
}

struct StarsAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        StarsAnimationView()
    }
}
