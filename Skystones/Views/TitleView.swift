//
//  TitleView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-22.
//

import SwiftUI

class TitleViewModel: ObservableObject {
    @Published var showPVPView = false
    @Published var showDifficultySelection = false
    @Published var showInstructionsView = false
}

struct TitleView: View {
    
    private enum Constants {
        static let gifName: String = "portal"
        static let gifDiameter: CGFloat = 500
        static let centeredGraphicImageName: String = "skystones-LC"
        static let titleMusicString: String = "TitleMusic"
        static let maxFrameDimension: CGFloat = 300
        static let frameDimMultiplier: CGFloat = 0.6
        static let pvpButtonTitle: String = "PVP (Player vs Player)"
        static let pvcButtonTitle: String = "PVC (Player vs Computer)"
        static let instructionButtonTitle: String = "Instructions"
        static let cornerRadius: CGFloat = 10
    }
    
    // MARK: - State Objects
    
    @StateObject var audioManager = AudioPlayerManager()
    @StateObject var viewModel = TitleViewModel()
    
    var background: some View {
        Color.black
    }
    
    var gifView: some View {
        GIFView(gifName: Constants.gifName)
            .scaledToFit()
            .ignoresSafeArea()
            .frame(width: Constants.gifDiameter, height: Constants.gifDiameter)
    }
    
    var centeredGraphic: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Image(Constants.centeredGraphicImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: min(geometry.size.width * Constants.frameDimMultiplier, Constants.maxFrameDimension),
                           height: min(geometry.size.width * Constants.frameDimMultiplier, Constants.maxFrameDimension))
                    .ignoresSafeArea()
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    var buttonToPVP: some View {
        Button(action: {
            audioManager.stopAudio()
            viewModel.showPVPView = true
        }) {
            Text(Constants.pvpButtonTitle)
                .font(.title2)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(Constants.cornerRadius)
        }
    }
    
    var buttonToPVC: some View {
        Button(action: {
            audioManager.stopAudio()
            viewModel.showDifficultySelection = true
        }) {
            Text(Constants.pvcButtonTitle)
                .font(.title2)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(Constants.cornerRadius)
        }
    }
    
    var buttonToInstructions: some View {
        Button(action: {
            audioManager.stopAudio()
            viewModel.showInstructionsView = true
        }) {
            Text(Constants.instructionButtonTitle)
                .font(.title2)
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(Constants.cornerRadius)
        }
    }
    
    var emptyTextView: some View {
        Text("")
    }
    
    var buttonVstack: some View {
        VStack(spacing: 50) {
            emptyTextView
            emptyTextView
            emptyTextView
            emptyTextView
            emptyTextView
            emptyTextView

            buttonToPVP
            buttonToPVC
            buttonToInstructions
            
        }
        .padding()
        .fullScreenCover(isPresented: $viewModel.showPVPView, onDismiss: {
            audioManager.playAudio(named: Constants.titleMusicString) // Restart music when returning to TitleView
        }) {
            PVPView()
        }
        .fullScreenCover(isPresented: $viewModel.showDifficultySelection, onDismiss: {
            audioManager.playAudio(named: Constants.titleMusicString) // Restart music when returning to TitleView
        }) {
            DifficultySelectionView(showPVCView: $viewModel.showDifficultySelection)
        }
        .fullScreenCover(isPresented: $viewModel.showInstructionsView, onDismiss: {
            audioManager.playAudio(named: Constants.titleMusicString) // Restart music when returning to TitleView
        }) {
            InstructionsView()
        }
    }

    var body: some View {
        ZStack {
            
            background
            gifView
            centeredGraphic
            
            buttonVstack
        }
        .onAppear {
            audioManager.playAudio(named: Constants.titleMusicString)
        }
        .ignoresSafeArea()
    }
}


#Preview {
    TitleView()
}
