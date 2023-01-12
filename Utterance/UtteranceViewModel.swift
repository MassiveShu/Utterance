//
//  UtteranceViewModel.swift
//  Utterance
//
//  Created by Max Shu on 27.12.2022.
//

import Foundation
import SwiftUI
import AVFoundation

final class UtteranceViewModel: ObservableObject {
    @Published var activeVolume: Float = 0.3
    @Published var activeText: String = "The evil lord Darth Vader, obsessed with finding young Skywalker, has dispatched thousands of remote probes across the far reaches of space..."
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
