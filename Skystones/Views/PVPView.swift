//
//  PVPView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import SwiftUI

struct PVPView: View {
    @StateObject var viewModel = GameViewModel()
    @StateObject var audioManager = AudioPlayerManager()
    @Environment(\.dismiss) var dismiss  // For dismissing the view
    
    private enum Constants {
        static let boardBGGifString = "BoardBG"
        static let navTitleString = "Skystones"
        static let backString = "Back"
        static let audioString = "GameBGMusic"
        static let zIndex = 0
        static let buttonCornerRadius = 100
        static let buttonTopPadding = 70
    }
    
    var backgroundColor: some View {
        Color.black
            .ignoresSafeArea()
    }
    
    var gifView: some View {
        GIFView(gifName: Constants.boardBGGifString)
            .scaledToFit()
            .ignoresSafeArea(.all)
    }
    
    var gameBoard: some View {
        GameBoardView(viewModel: viewModel, showComputerPieces: true)
            .navigationTitle(Constants.navTitleString)
            .padding()
            .background(Color.clear)
            .zIndex(CGFloat(Constants.zIndex))
    }
    
    var backButtonVstack: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()  // Dismiss the current view to return to TitleView
                }) {
                    Text(Constants.backString)
                        .font(.footnote)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(CGFloat(Constants.buttonCornerRadius))
                }
                .padding(.top, CGFloat(Constants.buttonTopPadding))
            }
            Spacer()
        }
    }
    
    var body: some View {
        ZStack {
            backgroundColor
            gifView
            gameBoard
            backButtonVstack
        }
        .onAppear {
            audioManager.playAudio(named: Constants.audioString)
        }
        .onDisappear {
            audioManager.stopAudio()
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    PVPView()
}




