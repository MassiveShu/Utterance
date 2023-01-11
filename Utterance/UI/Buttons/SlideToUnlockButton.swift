//
//  SlideToUnlockButton.swift
//  Utterance
//
//  Created by Max Shu on 20.12.2022.
//

import SwiftUI

struct SlideToUnlockButton: View {
    @State private var isLocked = true
    @State private var didSlide = false

    let animation = Animation.easeOut(duration: 1.7).delay(0.2).repeatForever(autoreverses: true)
    let gradient = Gradient(colors: [.black, .yellowStarWars, .yellowStarWars, .yellowStarWars, .black, .black, .black, .black, .black, .black, .black, .black])
    let action: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                background

                DragComponent(
                    isLocked: $isLocked,
                    action: action,
                    maxWidth: geometry.size.width)
            }
        }
        .frame(maxWidth: 350, maxHeight: 55)
        .onChange(of: isLocked) { isLocked in
            guard !isLocked else { return }
        }
    }
    
    private var background: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.lightBlueStarWars)
            
            LinearGradient(
                gradient: gradient,
                startPoint: didSlide ? .trailing: .leading,
                endPoint: .leading
            )
            .mask(Text("Continue..."))
            .font(.title2.bold())
            .onAppear() {
                withAnimation(animation) {
                    self.didSlide = true
                }
            }
        }
    }
}

struct SlideToUnlockButton_Previews: PreviewProvider {
    static var previews: some View {
        SlideToUnlockButton(action: {
            
        })
        .previewLayout(.sizeThatFits)
    }
}