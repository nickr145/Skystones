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

    var body: some View {
        VStack {
            // Piece Selection
            PieceSelectionView(viewModel: viewModel)
            
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
    
    return GameBoardView(viewModel: viewModel)
}

