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
    @Published var activeVolume: Float = 0.3
    @Published var isPlaying = false
    @Published var activeText: String = "The evil lord Darth Vader, obsessed with finding young Skywalker, has dispatched thousands of remote probes across the far reaches of space..."
    @Published var activeRate: Float = 0.5
    @Published var activePitch: Float = 1

    private lazy var synthesizer = AVSpeechSynthesizer()

    let maleGender = AVSpeechSynthesisVoice(identifier: "com.apple.voice.compact.en-GB.Daniel")
    let femaleGender = AVSpeechSynthesisVoice(identifier: "com.apple.voice.compact.en-US.Samantha")

    func playPause() {
        if isPlaying {
            stopPronouce()
        } else {
            pronounce()
        }
    }

    func pronounce() {
        if activeGender == .male {
            maleVoice()
        } else {
            femaleVoice()
        }
    }

    func stopPronouce() {
        synthesizer.stopSpeaking(at: .immediate)
        isPlaying = false
    }

    func maleVoice() {
        synthesizer.speak(AVSpeechUtterance(
            utterance: activeText,
            volume: activeVolume,
            rate: activeRate,
            pitch: activePitch,
            gender: maleGender)
        )
        isPlaying = true
    }

    func femaleVoice() {
        synthesizer.speak(AVSpeechUtterance(
            utterance: activeText,
            volume: activeVolume,
            rate: activeRate,
            pitch: activePitch,
            gender: femaleGender)
        )
        isPlaying = true
    }
}

extension AVSpeechUtterance {
    convenience init(utterance word: String, volume: Float, rate: Float, pitch: Float, gender: AVSpeechSynthesisVoice?) {
        self.init(string: word)
        self.volume = volume
        self.rate = rate
        self.pitchMultiplier = pitch
        self.voice = gender
    }
}
