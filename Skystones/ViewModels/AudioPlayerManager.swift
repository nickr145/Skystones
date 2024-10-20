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
        if let path = Bundle.main.path(forResource: fileName, ofType: fileType) {
            let url = URL(fileURLWithPath: path)
            
            do {
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Failed to initialize audio player: \(error)")
            }
        } else {
            print("Audio file not found.")
        }
    }
    
    func stopAudio() {
        audioPlayer?.stop()
    }
}
