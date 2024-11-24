//
//  AudioPlayerManager.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-10-19.
//

import Foundation
import AVFoundation
import AVKit
import SwiftUI

class AudioPlayerManager: ObservableObject {
    var audioPlayer: AVAudioPlayer!
    
    func playAudio(named fileName: String, fileType: String = "mp3") {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileType) else {
            print("Audio file not found.")
            return
        }
        
        do {
            audioPlayer = try? AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // indefinite loops
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Failed to initialize audio player: \(error.localizedDescription)")
        }
    }
    
    func stopAudio() {
        audioPlayer?.stop()
    }
}
