//
//  DragComponent.swift
//  Utterance
//
//  Created by Max Shu on 21.12.2022.
//

import SwiftUI
import CoreHaptics

struct DragComponent: View {
    @Binding var isLocked: Bool
    let action: () -> Void
    
    let maxWidth: CGFloat
    
    private let minWidth = CGFloat(50)
    @State private var width = CGFloat(50)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.yellowSW)
            // make a yellow color opacity when graging from 1 to 0
            .opacity(width / maxWidth)
            .frame(width: width)
            .overlay(
                // wrapping the component to the button and apply the button style:
                Button(action: action) {
                    ZStack {
                        image(name: "arrowshape.right", isShown: isLocked)
                        image(name: "lock.open", isShown: !isLocked)
                    }
                    .animation(.easeIn(duration: 0.35).delay(0.55), value: !isLocked)
                }
                    .buttonStyle(UnlockButtonStyle()),
                alignment: .trailing
            )
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                        guard isLocked else { return }
                        if value.translation.width > 0 {
                            width = min(max(value.translation.width + minWidth, minWidth), maxWidth)
                        }
                    }
                    .onEnded { value in
                        guard isLocked else { return }
                        if width < maxWidth {
                            width = minWidth
                            // add some haptics
                            UINotificationFeedbackGenerator().notificationOccurred(.warning)
                        } else {
                            // add some haptics
                            UINotificationFeedbackGenerator().notificationOccurred(.success)
                            withAnimation(.spring()) {
                                isLocked = false
                            }
                        }
                    }
            )
            .animation(.easeOut, value: width)
    }

    private func image(name: String, isShown: Bool) -> some View {
        Image(systemName: name)
            .font(.system(size: 25, weight: .regular, design: .rounded))
            .foregroundColor(Color.blue)
            .frame(width: 42, height: 42)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
            .padding(4)
            .opacity(isShown ? 1 : 0)
            .scaleEffect(isShown ? 1 : 0.01)
    }
}

struct DragComponent_Previews: PreviewProvider {
    static var previews: some View {
        DragComponent(
            isLocked: .constant(true),
            action: {
                
            },
            maxWidth: 50
        )
    }
}

