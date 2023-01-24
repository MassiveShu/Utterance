//
//  UtteranceViewModel.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import Foundation
import SwiftUI
import AVFoundation

final class UtteranceViewModel: NSObject, ObservableObject {
    @AppStorage("volume") var activeVolume: Double = 0.3
    @Published var activeText: String = "The evil lord Darth vader, obsessed with finding young Skywalker, has dispatched thousands of remote probes across the far reaches of space..."
    @AppStorage("rate") var activeRate: Double = 0.5
    @AppStorage("pitch") var activePitch: Double = 1
    @AppStorage("voice") var selectedVoice: String = ""
    @Published var isPlaying = false

    private lazy var synthesizer = AVSpeechSynthesizer()
    
    let allVoices: [AVSpeechSynthesisVoice]
    let allVoicesName: [String]

    override init() {
        self.allVoices = {
            AVSpeechSynthesisVoice.speechVoices().filter { voice in
                voice.language.starts(with: "en")
            }
        }()
        self.allVoicesName = allVoices.map(\.name)

        super.init()
        synthesizer.delegate = self

        //selectedVoice = allVoicesName.first ?? ""
    }
    
    func playPause() {
        if isPlaying {
            stopPronounce()
        } else {
            pronounce()
        }
    }
    
    func pronounce() {
        synthesizer.speak(AVSpeechUtterance(
            utterance: activeText,
            volume: activeVolume,
            rate: activeRate,
            pitch: activePitch,
            voice: allVoices.first(where: { voice in
                voice.name == selectedVoice
            })
        )
        )
        isPlaying = true
    }
    
    func stopPronounce() {
        synthesizer.stopSpeaking(at: .immediate)
        isPlaying = false
    }
}

extension UtteranceViewModel: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("Utterance: didStart")
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("Utterance: didFinish")
        isPlaying = false
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        print("Utterance: \((activeText as NSString).substring(with: characterRange))")
    }
}

extension AVSpeechUtterance {
    convenience init(utterance word: String, volume: Double, rate: Double, pitch: Double, voice: AVSpeechSynthesisVoice?) {
        self.init(string: word)
        self.volume = Float(volume)
        self.rate = Float(rate)
        self.pitchMultiplier = Float(pitch)
        self.voice = voice
    }
}
