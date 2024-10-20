//
//  DifficultySelectionView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-10-16.
//

import SwiftUI

struct DifficultySelectionView: View {
    @StateObject var audioManager = AudioPlayerManager() // Audio player manager
    @Environment(\.dismiss) var dismiss  // For dismissing the view
    @Binding var showPVCView: Bool
    @State private var showGameView = false // To navigate to PVCView
    @State private var selectedDifficulty: Int = 1 // Start with Level 1
    @State private var difficultyImageStrings = ["skystones-level1", "skystones-level2", "skystones-level3", "skystones-level4", "skystones-level5"]
    @State private var musicDifficultyStrings = ["Level1Music", "Level2Music", "Level3Music", "Level4Music", "Level5Music"] // Music for each level

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Select Difficulty")
                    .font(.title)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.black)
                    .cornerRadius(100)

                Picker("Difficulty", selection: $selectedDifficulty) {
                    ForEach(1..<6) { level in
                        Text("Level \(level)")
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding()
                .onChange(of: selectedDifficulty) { newLevel in
                    // Play the audio for the new difficulty when selection changes
                    playAudioForDifficulty(level: newLevel)
                }

                Image(difficultyImageStrings[selectedDifficulty]) // Adjust for zero-based index
                    .padding(60)

                Spacer()
                
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Back")
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.black)
                            .cornerRadius(100)
                    }
                    Button(action: {
                        showGameView = true
                        audioManager.stopAudio() // Stop music when starting the game
                    }) {
                        Text("Start Game")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.black)
                            .cornerRadius(100)
                            
                }
                }
            }
            .fullScreenCover(isPresented: $showGameView) {
                PVCView(difficulty: selectedDifficulty, showPVCView: $showPVCView)
            }
        }
        .onAppear {
            // Play the default audio for the initially selected difficulty
            playAudioForDifficulty(level: selectedDifficulty)
        }
        .onDisappear {
            audioManager.stopAudio() // Stop the music when leaving the view
        }
    }

    // Helper function to play audio for the selected difficulty
    private func playAudioForDifficulty(level: Int) {
        let musicTrack = musicDifficultyStrings[level] // Adjust for zero-based index
        audioManager.playAudio(named: musicTrack)
    }
}

struct DifficultySelectionView_Previews: PreviewProvider {
    @State static var showPVCView = false

    static var previews: some View {
        DifficultySelectionView(showPVCView: $showPVCView)
    }
}

