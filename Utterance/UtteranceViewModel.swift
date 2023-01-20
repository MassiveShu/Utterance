//
//  UtteranceViewModel.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import Foundation
import SwiftUI
import AVFoundation

//class SpeechVM: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
//    @Published var isSpeaking = false
//
//    private lazy var synthesizer = AVSpeechSynthesizer()
//    override init() {
//        super.init()
//        synthesizer.delegate = self
//    }
//    deinit {
//        synthesizer.delegate = nil
//    }
//
//    func speak(_ utterance: AVSpeechUtterance) {
//        self.synthesizer.speak(utterance)
//    }
//
//    internal func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
//        debugPrint("Utterance started")
//        isSpeaking = true
//    }
//}
protocol AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance)
}

final class UtteranceViewModel: ObservableObject, AVSpeechSynthesizerDelegate {
    @Published var activeVolume: Float = 0.3
    @Published var activeText: String = "The evil lord Darth vader, obsessed with finding young Skywalker, has dispatched thousands of remote probes across the far reaches of space..."
    @Published var activeRate: Float = 0.5
    @Published var activePitch: Float = 1
    @Published var selectedVoice: String = ""
    @Published var isPlaying = false
    
    private lazy var synthesizer = AVSpeechSynthesizer()
    
    let allVoices: [AVSpeechSynthesisVoice]
    let allVoicesName: [String]

    init() {
        self.allVoices = {
            AVSpeechSynthesisVoice.speechVoices().filter { voice in
                voice.language.starts(with: "en")
            }
        }()
        
        self.allVoicesName = allVoices.map(\.name)

        selectedVoice = allVoicesName.first ?? ""
    }
    
    func playPause() {
        if isPlaying {
            stopPronouce()
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
    
    func stopPronouce() {
        synthesizer.stopSpeaking(at: .immediate)
        isPlaying = false
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("Utterance has started")
    }
}

extension AVSpeechUtterance {
    convenience init(utterance word: String, volume: Float, rate: Float, pitch: Float, voice: AVSpeechSynthesisVoice?) {
        self.init(string: word)
        self.volume = volume
        self.rate = rate
        self.pitchMultiplier = pitch
        self.voice = voice
    }
}
