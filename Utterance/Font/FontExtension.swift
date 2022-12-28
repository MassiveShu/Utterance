//
//  FontExtension.swift
//  Utterance
//
//  Created by Max Shu on 26.12.2022.
//

import SwiftUI

extension Font {
    private static let starWarsFontName = "SfDistantGalaxyOutline"

    static func starWarsFont(size: CGFloat) -> Font {
        return .custom(starWarsFontName, size: size)
    }
}


//extension Font {
//    enum StarWarsFont {
//        case main
//        case custom(String)
//
//        var value: String {
//            switch self {
//            case .main:
//                return "SfDistantGalaxyOutline"
//
//            case .custom(let name):
//                return name
//            }
//        }
//    }
//
//    static func starWarsFont(_ type: StarWarsFont, size: CGFloat = 60) -> Font {
//        return .custom(type.value, size: size)
//    }
//}
