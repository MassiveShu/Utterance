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
    @Published var activeVolume: Float = 0.3 {
        didSet {
            MPVolumeView.setVolume(activeVolume)
        }
    }
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

    func changeGender() {
        
    }

    func changeRate() {

    }

    func changePitch() {

    }
}

extension AVSpeechUtterance {
    convenience init(utterance word: String) {
        self.init(string: word)

        rate = AVSpeechUtteranceDefaultSpeechRate
        //        pitchMultiplier = 1
        //        postUtteranceDelay = 0.5
        volume = 1
        voice = AVSpeechSynthesisVoice(language: "en-US")
    }
}

extension MPVolumeView {
    static func setVolume(_ volume: Float) -> Void {
        let volumeView = MPVolumeView()
        volumeView.showsVolumeSlider = false
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}
