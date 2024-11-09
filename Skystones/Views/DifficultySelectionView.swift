//
//  DifficultySelectionView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-10-16.
//

import SwiftUI

struct DifficultySelectionView: View {
    @StateObject var audioManager = AudioPlayerManager()
    @StateObject var viewModel = GameViewModel()
    
    @Environment(\.dismiss) var dismiss
    @Binding var showPVCView: Bool
    @State private var showGameView = false
    @State private var selectedDifficulty: Int = 1
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Back")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.green)
                            .border(Color.green)
                    }
                    Text("Select Difficulty")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.red)
                        .border(Color.red)
                }
                
                Picker("Difficulty", selection: $selectedDifficulty) {
                    ForEach(1..<6) { level in
                        Text("Level \(level)")
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding()
                
                Image(viewModel.difficultyImageStrings[selectedDifficulty])
                    .padding(60)
                
                Spacer()
                
                Button(action: {
                    showGameView = true
                    audioManager.stopAudio()
                }) {
                    Text("Start Game")
                        .font(.title)
                        .padding()
                        .foregroundColor(.blue)
                        .border(Color.blue)
                    
                }
            }
            .fullScreenCover(isPresented: $showGameView) {
                PVCView(difficulty: selectedDifficulty, showPVCView: $showPVCView)
            }
        }
        .onAppear {
            audioManager.playAudio(named: "DifficultySelectionMusic")
        }
    }
}

struct DifficultySelectionView_Previews: PreviewProvider {
    @State static var showPVCView = false
    
    static var previews: some View {
        DifficultySelectionView(showPVCView: $showPVCView)
    }
}

