//
//  FontExtension.swift
//  Utterance
//
//  Created by Max Shu on 26.12.2022.
//

import SwiftUI

extension Font {
    private static let starWarsFontName = "Starjedi"
    
    static func starWarsFont(size: CGFloat) -> Font {
        return .custom(starWarsFontName, size: size)
    }
}
