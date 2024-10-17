//
//  DifficultySelectionView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-10-16.
//

import SwiftUI

struct DifficultySelectionView: View {
    @Binding var showPVCView: Bool
    @State private var showGameView = false // To navigate to PVCView
    @State private var selectedDifficulty: Int = 1

    var body: some View {
        VStack {
            Text("Select Difficulty")
                .font(.title)

            Picker("Difficulty", selection: $selectedDifficulty) {
                ForEach(1..<6) { level in
                    Text("Level \(level)")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button(action: {
                showGameView = true
            }) {
                Text("Start Game")
                    .font(.title)
                    .padding()
            }
        }
        .fullScreenCover(isPresented: $showGameView) {
            PVCView(difficulty: selectedDifficulty, showPVCView: $showPVCView)
        }
    }
}


struct DifficultySelectionView_Previews: PreviewProvider {
    @State static var showPVCView = false

    static var previews: some View {
        DifficultySelectionView(showPVCView: $showPVCView)
    }
}
