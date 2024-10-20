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
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()


            GIFView(gifName: "BoardBG")
                .scaledToFit()
                .ignoresSafeArea(.all)
                
            GameBoardView(viewModel: viewModel)
                .navigationTitle("Skystones")
                .padding()
                .background(Color.clear)
                .zIndex(0)
            
            VStack {
                HStack {
                    Button(action: {
                        dismiss()  // Dismiss the current view to return to TitleView
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
            audioManager.playAudio(named: "GameBGMusic")
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




