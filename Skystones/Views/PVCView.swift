//
//  PVCView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-23.
//

import SwiftUI

struct PVCView: View {
    @StateObject var viewModel = GameViewModel()
    @Environment(\.dismiss) var dismiss  // For dismissing the view

    var body: some View {
        ZStack {
            Color.black
            
            GIFView(gifName: "BoardBG")
                .scaledToFit()
                .ignoresSafeArea()

            GameBoardView(viewModel: viewModel)
                .navigationTitle("PVC (Player vs Computer)")
                .padding()
                .background(Color.clear)
            
            VStack {
                Spacer()
                // Back button
                Button(action: {
                    dismiss()  // Dismiss the current view to return to TitleView
                }) {
                    Text("Back to Title Screen")
                        .font(.footnote)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(100)
                        .padding(.bottom,10)
                }
            }
        }
        .ignoresSafeArea()
        .onChange(of: viewModel.currentPlayer) { newPlayer in
            if newPlayer == 2 {
                performLvl1ComputerMove()
            }
        }
    }

    private func performLvl1ComputerMove() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            viewModel.Lvl1ComputerMove()
        }
    }
}


#Preview {
    PVCView()
}
