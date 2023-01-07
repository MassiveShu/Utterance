//
//  ViewModel.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import Foundation
import SwiftUI
import AVFoundation
import MediaPlayer

final class ViewModel: ObservableObject {
    @Published var activeGender: VoiceActingGender.Gender = .male
    @Published var activeVolume: Float = 0.3
    @Published var isPlaying = false
    @Published var activeText: String = "The evil lord Darth Vader, obsessed with finding young Skywalker, has dispatched thousands of remote probes across the far reaches of space..."
    @Published var activeRate: Float = 0.5
    @Published var activePitch: Float = 1

    private lazy var synthesizer = AVSpeechSynthesizer()
    private var utterance: AVSpeechUtterance!

    let male = AVSpeechSynthesisVoice(language: "en-GB")
    let female = AVSpeechSynthesisVoice(language: "en-US")

    func playPause() {
        if isPlaying {
            stopPronouce()
        } else {
            pronounce()
        }
    }

    func pronounce() {
        if activeGender == .male {
            synthesizer.speak(AVSpeechUtterance(utterance: activeText, volume: activeVolume, rate: activeRate, pitch: activePitch, gender: male))
            isPlaying = true
        } else {
            synthesizer.speak(AVSpeechUtterance(utterance: activeText, volume: activeVolume, rate: activeRate, pitch: activePitch, gender: female))
            isPlaying = true
        }
    }

    func stopPronouce() {
        synthesizer.stopSpeaking(at: .immediate)
        isPlaying = false
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
