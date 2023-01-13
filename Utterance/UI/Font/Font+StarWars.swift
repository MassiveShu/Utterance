//
//  FontExtension.swift
//  Utterance
//
//  Created by Max Shu on 26.12.2022.
//

import SwiftUI

extension Font {
    private static let starWarsMainFont = "SoloistStraight"

    static func starWarsMainFont(size: CGFloat) -> Font {
        .custom(starWarsMainFont, size: size)
    }
}
