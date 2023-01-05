//
//  ViewModel.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import Foundation
import SwiftUI
import AVFoundation

final class ViewModel: ObservableObject {
    @Published var activeGender: VoiceActingGender.Gender = .male
    @Published var activeVolume: Float = 1
    @Published var isPlaying = false
    @Published var activeText: String = "The evil lord Darth Vader, obsessed with finding young Skywalker, has dispatched thousands of remote probes across the far reaches of space..."
    @Published var activeRate: Float = 1
    @Published var activePitch: Float = 1

    private lazy var synthesizer = AVSpeechSynthesizer()
    private var utterance: AVSpeechUtterance!

    func pronounce() {
        synthesizer.speak(AVSpeechUtterance(utterance: activeText))
    }

    func stopPronouce() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

extension AVSpeechUtterance {
    convenience init(utterance word: String) {
        self.init(string: word)

        rate = AVSpeechUtteranceDefaultSpeechRate
        pitchMultiplier = 1
        postUtteranceDelay = 1
        volume = 1
        voice = AVSpeechSynthesisVoice(language: "en-US")
    }
}
