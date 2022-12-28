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
    // @Published var activeRate: SpeechRatePicker.Rate = .normalRate
    // @Published var activePitch: PitchMultiplierPicker.Pitch = .normalPitch
}
