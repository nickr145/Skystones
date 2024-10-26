//
//  GameBoardView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import SwiftUI

struct GameBoardView: View {
    @ObservedObject var viewModel: GameViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var showComputerPieces: Bool

    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Player 1")
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text("\(viewModel.player1Score)")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
                Spacer()
                VStack {
                    Text("Player 2")
                        .font(.headline)
                        .foregroundColor(.red)
                    Text("\(viewModel.player2Score)")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding()
            // Board Grid
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.board.indices, id: \.self) { index in
                    Group {
                        if let skystone = viewModel.board[index] {
                            SkystoneView(skystone: skystone)
                        } else {
                            EmptyCellView(index: index, onTap: {
                                if let selectedPiece = viewModel.selectedPiece {
                                    viewModel.placeSelectedPiece(at: index)
                                }
                            })
                        }
                    }
                }
            }
            .padding()
            .alert(isPresented: $viewModel.isGameOver) {
                Alert(
                    title: Text("Game Over"),
                    message: Text("Player \(viewModel.winner ?? 0) Wins!"),
                    dismissButton: .default(Text("OK")) {
                        viewModel.resetGame()
                    }
                )
            }
            // Piece Selection
            PieceSelectionView(viewModel: viewModel, showComputerPieces: showComputerPieces)
        }
    }
}


#Preview {
    let sampleStones = [
        Skystone(top: 2, right: 3, bottom: 1, left: 4, owner: 1),
        nil,
        Skystone(top: 1, right: 2, bottom: 3, left: 4, owner: 2),
        nil, nil, nil, nil, nil, nil
    ]
    
    let viewModel = GameViewModel()
    viewModel.board = sampleStones
    
    return GameBoardView(viewModel: viewModel, showComputerPieces: false)
}

