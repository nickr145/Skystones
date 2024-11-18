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

    var body: some View {
        VStack() {
            if (viewModel.currentPlayer == 1 || (showComputerPieces && viewModel.currentPlayer == 2)) {
                if (viewModel.currentPlayer == 1) {
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
                    
                } else {
                    
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
            } else {
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
        }
    }
}

#Preview {
    PieceSelectionView(viewModel: GameViewModel(), showComputerPieces: true)
}




