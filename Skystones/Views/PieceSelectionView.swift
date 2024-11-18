//
//  PieceSelectionView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-28.
//

import SwiftUI

struct PieceSelectionView: View {
    @ObservedObject var viewModel: GameViewModel
    var showComputerPieces: Bool
    
    private enum Constants {
        static let p1 = 1
        static let p2 = 2
    }
    
    var p1Pieces: some View {
        HStack {
            // Player 1's pieces
            ForEach(viewModel.player1Pieces.indices, id: \.self) { index in
                SkystoneView(skystone: viewModel.player1Pieces[index])
                    .onTapGesture {
                        viewModel.selectedPiece = viewModel.player1Pieces[index]
                    }
                    .border(viewModel.selectedPiece == viewModel.player1Pieces[index] ? Color.red : Color.clear)
            }
        }
        .padding()
    }
    
    var p2Pieces: some View {
        HStack {
            // Player 2's pieces
            ForEach(viewModel.player2Pieces.indices, id: \.self) { index in
                SkystoneView(skystone: viewModel.player2Pieces[index])
                    .onTapGesture {
                        viewModel.selectedPiece = viewModel.player2Pieces[index]
                    }
                    .border(viewModel.selectedPiece == viewModel.player2Pieces[index] ? Color.red : Color.clear)
            }
        }
        .padding()
    }

    var body: some View {
        VStack() {
            if (viewModel.currentPlayer == Constants.p1 || (showComputerPieces && viewModel.currentPlayer == Constants.p2)) {
                if (viewModel.currentPlayer == Constants.p1) {
                    p1Pieces
                } else {
                    p2Pieces
                }
            } else {
               p1Pieces
            }
        }
    }
}

#Preview {
    PieceSelectionView(viewModel: GameViewModel(), showComputerPieces: true)
}




