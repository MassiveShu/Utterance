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
    @Published var activeVolume: Float = 1
    @Published var isPlaying = false
    @Published var activeText: String = "The evil lord Darth Vader, obsessed with finding young Skywalker, has dispatched thousands of remote probes across the far reaches of space..."
    @Published var activeRate: Float = 1
    @Published var activePitch: Float = 1

    // @Published var activeRate: SpeechRatePicker.Rate = .normalRate
    // @Published var activePitch: PitchMultiplierPicker.Pitch = .normalPitch
}
