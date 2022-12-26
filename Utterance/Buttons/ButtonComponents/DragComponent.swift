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
            .opacity(width / maxWidth)
            .frame(width: width)
            .overlay(
                ZStack {
                    image(name: "arrowshape.right", isShown: isLocked)
                    image(name: "lock.open", isShown: !isLocked)
                }
                    .animation(.easeIn(duration: 0.35), value: !isLocked),
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
                        hapticResponse()
                        if width < maxWidth {
                            width = minWidth
                        } else {
                            hapticResponse()
                            action()
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

    func hapticResponse() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        let haptic = UINotificationFeedbackGenerator()
        haptic.notificationOccurred(.success)
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

