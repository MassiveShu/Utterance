//
//  FontExtension.swift
//  Utterance
//
//  Created by Max Shu on 26.12.2022.
//

import SwiftUI

//extension Font {
//    static var StarWarsFont: Font {
//        Font.custom("SfDistantGalaxyOutline", size: 60)
//    }
//}

extension Font {
    enum StarWarsFont {
        case main
        case custom(String)

        var value: String {
            switch self {
            case .main:
                return "SfDistantGalaxyOutline"

            case .custom(let name):
                return name
            }
        }
    }

    static func starWarsFont(_ type: StarWarsFont, size: CGFloat = 60) -> Font {
        return .custom(type.value, size: size)
    }
}
