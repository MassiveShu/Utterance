//
//  TextFieldStyle.swift
//  Utterance
//
//  Created by Max Shu on 12.01.2023.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(.black)
            .cornerRadius(10)
            .shadow(color: .blackWhite, radius: 5)
    }
}
