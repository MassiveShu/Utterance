//
//  SlideToUnlockButtonView.swift
//  Utterance
//
//  Created by Max Shu on 20.12.2022.
//

import SwiftUI

struct SlideToUnlockButtonView: View {
    @State private var isLocked = true
    let action: () -> Void

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                BackgroundComponent()
                DragComponent(
                    isLocked: $isLocked,
                    action: action,
                    maxWidth: geometry.size.width)
            }
        }
        .frame(width: 350, height: 55)
        .onChange(of: isLocked) { isLocked in
            guard !isLocked else { return }
        }
    }
}

struct SlideToUnlockButton_Previews: PreviewProvider {
    static var previews: some View {
        SlideToUnlockButtonView(action: {

        })
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}
