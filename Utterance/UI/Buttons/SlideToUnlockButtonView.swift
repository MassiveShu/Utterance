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
                .fill(Color.lightBlueSW)

            Text("Let's go")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
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
