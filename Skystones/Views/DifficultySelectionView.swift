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
                            .foregroundStyle(.green)
                            .border(Color.green)
                    }
                    Text("Select Difficulty")
                        .font(.largeTitle)
                        .padding()
                        .foregroundStyle(.red)
                        .border(Color.red)
                }
                
                Picker("Difficulty", selection: $selectedDifficulty) {
                    ForEach(1..<7, id: \.self) { level in
                        Text("Level \(level)")
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding()
                
                Text("\(viewModel.difficultyLevelNameStrings[selectedDifficulty-1])")
                    .foregroundStyle((selectedDifficulty < 3 ? .green : (selectedDifficulty < 5 ? .yellow : .red)))
                
                
                Image(viewModel.difficultyImageStrings[selectedDifficulty-1])
                    .padding(10)
                
                Spacer()
                
                Button(action: {
                    showGameView = true
                    audioManager.stopAudio()
                }) {
                    Text("Start Game")
                        .font(.title)
                        .padding()
                        .foregroundStyle(.blue)
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

