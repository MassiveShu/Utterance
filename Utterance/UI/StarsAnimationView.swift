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
            Color.blackWhite.edgesIgnoringSafeArea(.all)
            
            VStack {
                ForEach(Constant.linesOfStars, id: \.self) { _ in
                    HStack {
                        ForEach(Constant.numberOfStars, id: \.self) { _ in
                            Circle()
                                .fill(Color.whiteBlack)
                                .frame(width: 3, height: 2)
                                .blur(radius: runAnimation ? 1 : 0)
                                .padding(
                                    EdgeInsets(
                                        top: self.randomPadding(),
                                        leading: 0,
                                        bottom: 0,
                                        trailing: self.randomPadding()
                                    )
                                )
                                .onAppear() {
                                    let animation = Animation.easeOut(duration: 13).repeatForever()
                                    withAnimation(animation) {
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
    
    func randomPadding() -> CGFloat {
        CGFloat(Int.random(in: 20..<150))
    }
    
    private var overlayGradient: some View {
        Rectangle().fill(
            LinearGradient(
                gradient: Gradient(colors: [.lightBlue, .blackWhite]),
                startPoint: .top,
                endPoint: .center
            )
            .opacity(0.4)
        )
    }
}

struct StarsAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        StarsAnimationView()
    }
}
