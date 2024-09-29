//
//  GameViewModel.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var board: [Skystone?] = Array(repeating: nil, count: 9)
    @Published var player1Pieces: [Skystone] = [
        Skystone(top: 2, right: 3, bottom: 1, left: 4, owner: 1),
        Skystone(top: 3, right: 4, bottom: 2, left: 1, owner: 1),
        Skystone(top: 1, right: 2, bottom: 3, left: 4, owner: 1),
        Skystone(top: 4, right: 1, bottom: 2, left: 3, owner: 1),
        Skystone(top: 2, right: 1, bottom: 4, left: 3, owner: 1)
    ]
    @Published var player2Pieces: [Skystone] = [
        Skystone(top: 1, right: 3, bottom: 2, left: 4, owner: 2),
        Skystone(top: 2, right: 4, bottom: 3, left: 1, owner: 2),
        Skystone(top: 4, right: 2, bottom: 1, left: 3, owner: 2),
        Skystone(top: 3, right: 1, bottom: 4, left: 2, owner: 2),
        Skystone(top: 1, right: 2, bottom: 4, left: 3, owner: 2)
    ]
    @Published var computerPieces: [Skystone] = [
        Skystone(top: 1, right: 3, bottom: 2, left: 4, owner: 2),
        Skystone(top: 2, right: 4, bottom: 3, left: 1, owner: 2),
        Skystone(top: 4, right: 2, bottom: 1, left: 3, owner: 2),
        Skystone(top: 3, right: 1, bottom: 4, left: 2, owner: 2),
        Skystone(top: 1, right: 2, bottom: 4, left: 3, owner: 2)
    ]
    @Published var selectedPiece: Skystone?
    @Published var currentPlayer: Int = 1
    @Published var isGameOver: Bool = false
    @Published var winner: Int?
    
    func Lvl1ComputerMove() {
        let availableCells = board.indices.filter { board[$0] == nil }
        if let randomCell = availableCells.randomElement() {
            placeStone(at: randomCell)
        }
    }
    
    func placeSelectedPiece(at index: Int) {
        guard board[index] == nil, let selectedPiece = selectedPiece else { return }
        
        board[index] = selectedPiece
        captureAdjacentStones(at: index)
        
        // Remove the placed piece from the current player's available pieces
        if currentPlayer == 1 {
            if let selectedIndex = player1Pieces.firstIndex(of: selectedPiece) {
                player1Pieces.remove(at: selectedIndex)
            }
        } else {
            if let selectedIndex = player2Pieces.firstIndex(of: selectedPiece) {
                player2Pieces.remove(at: selectedIndex)
            }
        }
        
        // Reset selected piece
        self.selectedPiece = nil

        if checkGameOver() {
            isGameOver = true
            winner = calculateWinner()
        } else {
            currentPlayer = currentPlayer == 1 ? 2 : 1
        }
    }

    
    func placeStone(at index: Int) {
        guard board[index] == nil else { return }
        
        let stone = Skystone(top: Int.random(in: 1...4), right: Int.random(in: 1...4), bottom: Int.random(in: 1...4), left: Int.random(in: 1...4), owner: currentPlayer)
        board[index] = stone
        
        captureAdjacentStones(at: index)
        
        if checkGameOver() {
            isGameOver = true
            winner = calculateWinner()
        } else {
            currentPlayer = currentPlayer == 1 ? 2 : 1
        }
    }

    func captureAdjacentStones(at index: Int) {
        let stone = board[index]!

        // Capture top stone
        if index >= 3, let topStone = board[index - 3], stone.canCapture(topStone, direction: .top) {
            board[index - 3]?.owner = stone.owner
        }

        // Capture bottom stone
        if index <= 5, let bottomStone = board[index + 3], stone.canCapture(bottomStone, direction: .bottom) {
            board[index + 3]?.owner = stone.owner
        }

        // Capture left stone
        if index % 3 != 0, let leftStone = board[index - 1], stone.canCapture(leftStone, direction: .left) {
            board[index - 1]?.owner = stone.owner
        }

        // Capture right stone
        if index % 3 != 2, let rightStone = board[index + 1], stone.canCapture(rightStone, direction: .right) {
            board[index + 1]?.owner = stone.owner
        }
    }

    
    func resetGame() {
        board = Array(repeating: nil, count: 9)
        currentPlayer = 1
        isGameOver = false
        winner = nil
    }
    
    func checkGameOver() -> Bool {
        return board.filter { $0 == nil }.isEmpty
    }
    
    func calculateWinner() -> Int {
        let player1Stones = board.filter { $0?.owner == 1 }.count
        let player2Stones = board.filter { $0?.owner == 2 }.count
        return player1Stones > player2Stones ? 1 : 2
    }
}
