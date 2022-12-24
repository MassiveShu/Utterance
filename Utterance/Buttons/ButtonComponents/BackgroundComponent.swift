//
//  BackgroundComponent.swift
//  Utterance
//
//  Created by Max Shu on 21.12.2022.
//

import SwiftUI

struct BackgroundComponent: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.lightBlueSW)
            
            Text("Let's go")
                .font(.body)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
    }
}

struct BackgroundComponent_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundComponent()
    }
}
