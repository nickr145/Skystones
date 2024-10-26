//
//  PVCView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-23.
//

import SwiftUI

struct PVCView: View {
    @StateObject var audioManager = AudioPlayerManager()
    var difficulty: Int
    @StateObject var viewModel = GameViewModel()
    //@Environment(\.dismiss) var dismiss  // For dismissing the view
    @Binding var showPVCView: Bool

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            GIFView(gifName: "BoardBG")
                .scaledToFit()
                .ignoresSafeArea()

            GameBoardView(viewModel: viewModel, showComputerPieces: false)
                .navigationTitle("PVC (Player vs Computer)")
                .padding()
                .background(Color.clear)
                .zIndex(0)
            
            VStack {
                HStack {
                    Button(action: {
                        showPVCView = false // Dismiss the current view to return to TitleView
                    }) {
                        Text("Back")
                            .font(.footnote)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.black)
                            .cornerRadius(100)
                    }
                    .padding(.top, 70)
                }
                Spacer()
            }
        }
        .onAppear {
            viewModel.setupComputerDifficulty(difficulty)
            audioManager.playAudio(named: "GameBGMusic")
        }
        .onDisappear {
            audioManager.stopAudio()
        }
        .ignoresSafeArea(.all)
        .onChange(of: viewModel.currentPlayer) { newPlayer in
            if newPlayer == 2 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    viewModel.performComputerMove()
                }
            }
        }
        
    }
}


struct PVCView_Previews: PreviewProvider {
    @State static var showPVCView = false

    static var previews: some View {
        PVCView(difficulty: 3, showPVCView: $showPVCView)
    }
}
