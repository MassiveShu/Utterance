//
//  ColorStyle.swift
//  Utterance
//
//  Created by Max Shu on 21.12.2022.
//

import SwiftUI

extension Color {
    static let yellowSW: Color = Color("yellowSWColor")
    static let lightBlueSW: Color = Color("lightBlueSWColor")
}

#if os(iOS)
import UIKit
extension Color {
    static let label = Color(uiColor: .label)
    static let textBackground = Color(uiColor: .systemBackground)
}
#endif
