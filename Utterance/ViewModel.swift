//
//  ViewModel.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    @Published var activeGender: VoiceActingGender.Gender = .male

}
