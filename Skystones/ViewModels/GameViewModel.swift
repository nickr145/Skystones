//
//  GameViewModel.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var board: [Skystone?] = Array(repeating: nil, count: 9)
    @Published var currentPlayer: Int = 1
    @Published var isGameOver: Bool = false
    @Published var winner: Int?  // Tracks the winner
    
    func Lvl1ComputerMove() {
        let availableCells = board.indices.filter { board[$0] == nil }
        if let randomCell = availableCells.randomElement() {
            placeStone(at: randomCell)
        }
    }
    
    // Place a stone on the board and check captures
    func placeStone(at index: Int) {
        guard board[index] == nil else { return }  // Ensure the spot is free
        
        // Place a new stone for the current player
        let stone = Skystone(top: Int.random(in: 1...4), right: Int.random(in: 1...4), bottom: Int.random(in: 1...4), left: Int.random(in: 1...4), owner: currentPlayer)
        board[index] = stone
        
        // Attempt to capture adjacent stones
        captureAdjacentStones(at: index)
        
        // Check if the game is over after placing the stone
        if checkGameOver() {
            isGameOver = true
            winner = calculateWinner()  // Determine the winner
        } else {
            // Only switch the player if the game is not over
            currentPlayer = currentPlayer == 1 ? 2 : 1
        }
    }

    
    // Capture adjacent stones based on their directions
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
    
    // Check if the game has ended (when all slots are filled)
    func checkGameOver() -> Bool {
        return board.filter { $0 == nil }.isEmpty
    }
    
    // Simple winner determination logic (e.g., more pieces on the board)
    func calculateWinner() -> Int {
        let player1Stones = board.filter { $0?.owner == 1 }.count
        let player2Stones = board.filter { $0?.owner == 2 }.count
        return player1Stones > player2Stones ? 1 : 2
    }
}
