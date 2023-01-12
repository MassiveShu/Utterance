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
    @State private var engine: CHHapticEngine?
    
    let action: () -> Void
    
    @State private var width = CGFloat(50)
    let maxWidth: CGFloat
    private let minWidth = CGFloat(50)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.yellowCustom)
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
            .gesture(
                DragGesture()
                    .onChanged { value in
                        guard isLocked else { return }
                        if value.translation.width > 0 {
                            width = min(max(value.translation.width + minWidth, minWidth), maxWidth)
                        }
                    }
                    .onEnded { value in
                        guard isLocked else { return }
                        hapticsSuccess()
                        if width < maxWidth {
                            width = minWidth
                        } else {
                            hapticsSuccess()
                            action()
                            withAnimation(.spring()) {
                                isLocked = false
                            }
                        }
                    }
            )
            .onAppear(perform: prepareHaptics)
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
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Error with creating the engine: \(error.localizedDescription)")
        }
    }
    
    func hapticsSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events  = [CHHapticEvent]()
        
        for i in stride(from: 0, through: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
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
