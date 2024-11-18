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
    @Binding var showPVCView: Bool
    
    private enum Constants {
        static let gifnameString = "BoardBG"
        static let pvcNavTitleString = "PVC (Player vs Computer)"
        static let backButtonString = "Back"
        static let zIndex = 0
        static let backButtonCornerRadius = 100
        static let backButtonPadding = 70
    }
    
    var blackBackground: some View {
        Color.black
            .ignoresSafeArea()
    }
    
    var gifView: some View {
        GIFView(gifName: Constants.gifnameString)
            .scaledToFit()
            .ignoresSafeArea()
    }
    
    var gameBoardView: some View {
        GameBoardView(viewModel: viewModel, showComputerPieces: false)
            .navigationTitle(Constants.pvcNavTitleString)
            .padding()
            .background(Color.clear)
            .zIndex(CGFloat(Constants.zIndex))
    }
    
    var buttonTextView: some View {
        Text(Constants.backButtonString)
            .font(.footnote)
            .padding()
            .background(Color.green)
            .foregroundColor(.black)
            .cornerRadius(CGFloat(Constants.backButtonCornerRadius))
    }
    
    var buttonView: some View {
        Button(action: {
            showPVCView = false // Dismiss the current view to return to TitleView
        }) {
            buttonTextView
        }
        .padding(.top, CGFloat(Constants.backButtonPadding))
    }
    
    var spacerView: some View {
        Spacer()
    }
    
    var buttonVstack: some View {
        VStack {
            HStack {
                buttonView
            }
            spacerView
        }
    }

    var body: some View {
        ZStack {
            blackBackground
            gifView
            gameBoardView
            buttonVstack
        }
        .onAppear {
            viewModel.setupComputerDifficulty(difficulty)
            audioManager.playAudio(named: viewModel.musicDifficultyStrings[difficulty-1])
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
