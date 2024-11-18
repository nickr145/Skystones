//
//  GameViewModel.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var difficultyImageStrings = GameStringConstants.difficultyImageStrings
    @Published var difficultyLevelNameStrings = GameStringConstants.difficultyLevelNameStrings
    @Published var musicDifficultyStrings = GameStringConstants.musicDifficultyStrings
    
    @Published var board: [Skystone?] = Array(repeating: nil, count: 9)
    @Published var player1Pieces: [Skystone] = [
        Skystone(top: 3, right: 2, bottom: 3, left: 2, owner: 1),
        Skystone(top: 2, right: 3, bottom: 2, left: 3, owner: 1),
        Skystone(top: 4, right: 1, bottom: 3, left: 2, owner: 1),
        Skystone(top: 2, right: 4, bottom: 2, left: 3, owner: 1),
        Skystone(top: 3, right: 3, bottom: 2, left: 3, owner: 1)
    ]
    @Published var player2Pieces: [Skystone] = [
        Skystone(top: 3, right: 2, bottom: 3, left: 2, owner: 2),
        Skystone(top: 2, right: 3, bottom: 2, left: 3, owner: 2),
        Skystone(top: 4, right: 1, bottom: 3, left: 2, owner: 2),
        Skystone(top: 2, right: 4, bottom: 2, left: 3, owner: 2),
        Skystone(top: 3, right: 3, bottom: 2, left: 3, owner: 2)
    ]
    @Published var selectedPiece: Skystone?
    @Published var currentPlayer: Int = 1
    @Published var isGameOver: Bool = false
    @Published var winner: Int?
    @Published var player1Score: Int = 0
    @Published var player2Score: Int = 0
    
    private var level1Pieces: [Skystone] = [
        Skystone(top: 1, right: 0, bottom: 1, left: 2, owner: 2),
        Skystone(top: 1, right: 1, bottom: 0, left: 2, owner: 2),
        Skystone(top: 0, right: 2, bottom: 1, left: 1, owner: 2),
        Skystone(top: 1, right: 1, bottom: 2, left: 0, owner: 2),
        Skystone(top: 2, right: 0, bottom: 1, left: 1, owner: 2)
    ]
    private var level2Pieces: [Skystone] = [
        Skystone(top: 2, right: 1, bottom: 2, left: 2, owner: 2),
        Skystone(top: 2, right: 2, bottom: 1, left: 2, owner: 2),
        Skystone(top: 1, right: 3, bottom: 2, left: 1, owner: 2),
        Skystone(top: 2, right: 2, bottom: 2, left: 1, owner: 2),
        Skystone(top: 3, right: 1, bottom: 2, left: 2, owner: 2)
    ]
    private var level3Pieces: [Skystone] = [
        Skystone(top: 3, right: 2, bottom: 3, left: 1, owner: 2),
        Skystone(top: 2, right: 3, bottom: 1, left: 3, owner: 2),
        Skystone(top: 3, right: 3, bottom: 2, left: 1, owner: 2),
        Skystone(top: 4, right: 3, bottom: 3, left: 2, owner: 2),
        Skystone(top: 2, right: 4, bottom: 3, left: 2, owner: 2)
    ]
    private var level4Pieces: [Skystone] = [
        Skystone(top: 3, right: 4, bottom: 2, left: 3, owner: 2),
        Skystone(top: 4, right: 3, bottom: 4, left: 1, owner: 2),
        Skystone(top: 3, right: 4, bottom: 3, left: 2, owner: 2),
        Skystone(top: 4, right: 2, bottom: 3, left: 4, owner: 2),
        Skystone(top: 3, right: 3, bottom: 4, left: 3, owner: 2)
    ]
    private var level5Pieces: [Skystone] = [
        Skystone(top: 3, right: 4, bottom: 3, left: 4, owner: 2),
        Skystone(top: 4, right: 2, bottom: 4, left: 3, owner: 2),
        Skystone(top: 3, right: 4, bottom: 3, left: 4, owner: 2),
        Skystone(top: 0, right: 3, bottom: 4, left: 4, owner: 2),
        Skystone(top: 4, right: 4, bottom: 2, left: 4, owner: 2)
    ]
    private var level6Pieces: [Skystone] = [
        Skystone(top: 3, right: 3, bottom: 3, left: 4, owner: 2),
        Skystone(top: 3, right: 4, bottom: 5, left: 3, owner: 2),
        Skystone(top: 4, right: 4, bottom: 4, left: 4, owner: 2),
        Skystone(top: 5, right: 3, bottom: 3, left: 3, owner: 2),
        Skystone(top: 3, right: 4, bottom: 4, left: 4, owner: 2),
    ]
    
    private var player1PiecesForEachDifficulty: [[Skystone]] = [
        [Skystone(top: 1, right: 2, bottom: 1, left: 0, owner: 1),
         Skystone(top: 2, right: 1, bottom: 2, left: 0, owner: 1),
         Skystone(top: 1, right: 3, bottom: 0, left: 1, owner: 1),
         Skystone(top: 2, right: 2, bottom: 1, left: 1, owner: 1),
         Skystone(top: 1, right: 2, bottom: 1, left: 2, owner: 1)
        ],
        [Skystone(top: 2, right: 3, bottom: 1, left: 2, owner: 1),
         Skystone(top: 3, right: 2, bottom: 1, left: 1, owner: 1),
         Skystone(top: 2, right: 2, bottom: 2, left: 0, owner: 1),
         Skystone(top: 1, right: 3, bottom: 3, left: 1, owner: 1),
         Skystone(top: 2, right: 2, bottom: 3, left: 1, owner: 1)
        ],
        [Skystone(top: 2, right: 3, bottom: 2, left: 2, owner: 1),
         Skystone(top: 3, right: 3, bottom: 1, left: 2, owner: 1),
         Skystone(top: 3, right: 1, bottom: 3, left: 2, owner: 1),
         Skystone(top: 2, right: 3, bottom: 2, left: 2, owner: 1),
         Skystone(top: 1, right: 2, bottom: 3, left: 1, owner: 1)
        ],
        [Skystone(top: 3, right: 2, bottom: 3, left: 1, owner: 1),
         Skystone(top: 2, right: 3, bottom: 3, left: 2, owner: 1),
         Skystone(top: 4, right: 3, bottom: 2, left: 2, owner: 1),
         Skystone(top: 1, right: 2, bottom: 3, left: 2, owner: 1),
         Skystone(top: 2, right: 1, bottom: 4, left: 2, owner: 1)
        ],
        [Skystone(top: 3, right: 3, bottom: 3, left: 2, owner: 1),
         Skystone(top: 1, right: 3, bottom: 4, left: 1, owner: 1),
         Skystone(top: 2, right: 2, bottom: 3, left: 3, owner: 1),
         Skystone(top: 3, right: 3, bottom: 3, left: 3, owner: 1),
         Skystone(top: 2, right: 4, bottom: 4, left: 3, owner: 1)
        ],
        [Skystone(top: 3, right: 3, bottom: 4, left: 4, owner: 1),
         Skystone(top: 4, right: 4, bottom: 4, left: 3, owner: 1),
         Skystone(top: 3, right: 3, bottom: 3, left: 3, owner: 1),
         Skystone(top: 4, right: 3, bottom: 3, left: 4, owner: 1),
         Skystone(top: 3, right: 4, bottom: 3, left: 3, owner: 1)
        ]
    ]
    
    var selectedDifficulty: Int = 1
    
    func updateScores() {
        let player1Stones = board.filter { $0?.owner == 1 }.count
        let player2Stones = board.filter { $0?.owner == 2 }.count
        player1Score = player1Stones
        player2Score = player2Stones
    }
    
    func setupComputerDifficulty(_ level: Int) {
        selectedDifficulty = level
        switch selectedDifficulty {
        case 1:
            player2Pieces = level1Pieces
            player1Pieces = player1PiecesForEachDifficulty[0]
        case 2:
            player2Pieces = level2Pieces
            player1Pieces = player1PiecesForEachDifficulty[1]
        case 3:
            player2Pieces = level3Pieces
            player1Pieces = player1PiecesForEachDifficulty[2]
        case 4:
            player2Pieces = level4Pieces
            player1Pieces = player1PiecesForEachDifficulty[3]
        case 5:
            player2Pieces = level5Pieces
            player1Pieces = player1PiecesForEachDifficulty[4]
        case 6:
            player2Pieces = level6Pieces
            player1Pieces = player1PiecesForEachDifficulty[5]
        default:
            player2Pieces = level1Pieces
            player1Pieces = player1PiecesForEachDifficulty[0]
        }
    }
    
    // Method to perform moves based on difficulty level
    func performComputerMove() {
        switch selectedDifficulty {
        case 1:
            Lvl1ComputerMove()  // Random moves
        case 2:
            Lvl2ComputerMove()  // Basic strategy: avoid bad spots
        case 3:
            Lvl3ComputerMove()  // More advanced strategy
        case 4:
            Lvl4ComputerMove()  // MiniMax algorithm, depth limited
        case 5:
            Lvl5ComputerMove()  // MiniMax with Alpha-Beta pruning
        case 6:
            Lvl5ComputerMove()
        default:
            Lvl1ComputerMove()  // Default to level 1 if not specified
        }
    }
    
    func Lvl1ComputerMove() {
        let availableCells = board.indices.filter { board[$0] == nil }
        
        // Ensure the computer has pieces left to place
        guard !player2Pieces.isEmpty, let randomCell = availableCells.randomElement() else { return }
        
        // Pick a random piece from player2's available pieces
        if let randomPiece = player2Pieces.randomElement() {
            selectedPiece = randomPiece
            placeSelectedPiece(at: randomCell) // Use placeSelectedPiece to handle removing the piece
        }
    }
    
    // Level 2 AI: Avoid bad spots, basic capture logic
    func Lvl2ComputerMove() {
        let availableCells = board.indices.filter { board[$0] == nil }
        
        // Basic heuristic: avoid edges or spots where capture is easy
        let prioritizedCells = availableCells.filter { $0 != 0 && $0 != 2 && $0 != 6 && $0 != 8 }
        
        let cellToPlace = prioritizedCells.isEmpty ? availableCells.randomElement() : prioritizedCells.randomElement()
        
        if let randomPiece = player2Pieces.randomElement(), let cell = cellToPlace {
            selectedPiece = randomPiece
            placeSelectedPiece(at: cell)
        }
    }
    
    // Level 3 AI: Aggressive capture strategy
    func Lvl3ComputerMove() {
        let availableCells = board.indices.filter { board[$0] == nil }
        
        // Prioritize capture moves
        for cell in availableCells {
            if let piece = player2Pieces.randomElement() {
                if canCaptureAdjacent(at: cell, with: piece) {
                    selectedPiece = piece
                    placeSelectedPiece(at: cell)
                    return
                }
            }
        }
        
        // Fall back to random if no captures available
        Lvl1ComputerMove()
    }
    
    func Lvl4ComputerMove() {
        let availableCells = board.indices.filter { board[$0] == nil }
        guard !player2Pieces.isEmpty else { return }
        
        // Try to find a move that will capture stones
        for cell in availableCells {
            if let randomPiece = player2Pieces.randomElement() {
                if canCaptureAt(cell: cell, with: randomPiece) {
                    selectedPiece = randomPiece
                    placeSelectedPiece(at: cell)
                    return
                }
            }
        }
        
        // Fallback to random move if no capture opportunities
        if let randomCell = availableCells.randomElement(),
           let randomPiece = player2Pieces.randomElement() {
            selectedPiece = randomPiece
            placeSelectedPiece(at: randomCell)
        }
    }
    
    func Lvl5ComputerMove() {
        let availableCells = board.indices.filter { board[$0] == nil }
        guard !player2Pieces.isEmpty else { return }
        
        var bestScore = Int.min
        var bestMove: (cell: Int, piece: Skystone)?
        
        for cell in availableCells {
            if let randomPiece = player2Pieces.randomElement() {
                // Simulate placing the piece and calculate the score
                let simulatedScore = simulateMove(for: randomPiece, at: cell)
                if simulatedScore > bestScore {
                    bestScore = simulatedScore
                    bestMove = (cell, randomPiece)
                }
            }
        }
        
        // Perform the best move
        if let bestMove = bestMove {
            selectedPiece = bestMove.piece
            placeSelectedPiece(at: bestMove.cell)
        }
    }
    
    func Lvl6ComputerMove() {
        guard currentPlayer == 2, !isGameOver else { return }
        
        var bestMove: (index: Int, piece: Skystone)? = nil
        var maxScoreDifference = Int.min
        
        // Loop through all available board positions
        for (index, tile) in board.enumerated() where tile == nil {
            // Try every piece in player2Pieces
            for piece in player2Pieces {
                // Simulate placing the piece
                var simulatedBoard = board
                simulatedBoard[index] = piece
                
                // Simulate capturing opponent pieces
                let capturedPieces = simulateCaptures(for: piece, at: index, on: simulatedBoard)
                
                // Calculate score difference
                let aiScore = simulatedBoard.filter { $0?.owner == 2 }.count
                let playerScore = simulatedBoard.filter { $0?.owner == 1 }.count
                let scoreDifference = aiScore - playerScore
                
                // Update the best move if this one is better
                if scoreDifference > maxScoreDifference {
                    maxScoreDifference = scoreDifference
                    bestMove = (index, piece)
                }
            }
        }
        
        // Execute the best move
        if let bestMove = bestMove {
            // Set the selected piece for the computer
            selectedPiece = bestMove.piece
            placeSelectedPiece(at: bestMove.index)
            currentPlayer = 1
            updateScores()
        }
    }
    
    
    private func simulateCaptures(for piece: Skystone, at index: Int, on board: [Skystone?]) -> [Int] {
        let directions: [(offset: Int, checkIndex: Int)] = [
            (-3, index - 3),  // Top
            (3, index + 3),   // Bottom
            (-1, index - 1),  // Left
            (1, index + 1)    // Right
        ]
        
        var capturedIndices: [Int] = []
        
        for (offset, checkIndex) in directions {
            guard checkIndex >= 0, checkIndex < board.count else { continue }
            guard let adjacentPiece = board[checkIndex], adjacentPiece.owner != piece.owner else { continue }
            
            // Compare values in the appropriate direction
            let isCapture = (
                (offset == -3 && piece.top > adjacentPiece.bottom) ||    // Top
                (offset == 3 && piece.bottom > adjacentPiece.top) ||     // Bottom
                (offset == -1 && piece.left > adjacentPiece.right) ||    // Left
                (offset == 1 && piece.right > adjacentPiece.left)        // Right
            )
            
            if isCapture {
                capturedIndices.append(checkIndex)
            }
        }
        
        return capturedIndices
    }
    
    
    // Logic for being able to capture adjacent cells with a given piece for level 3 AI
    func canCaptureAdjacent(at index: Int, with piece: Skystone) -> Bool {
        // Simplified logic to check if placing the piece will capture anything
        // Check top, bottom, left, right neighbors
        if index >= 3, let topStone = board[index - 3], piece.canCapture(topStone, direction: .top) {
            return true
        }
        if index <= 5, let bottomStone = board[index + 3], piece.canCapture(bottomStone, direction: .bottom) {
            return true
        }
        if index % 3 != 0, let leftStone = board[index - 1], piece.canCapture(leftStone, direction: .left) {
            return true
        }
        if index % 3 != 2, let rightStone = board[index + 1], piece.canCapture(rightStone, direction: .right) {
            return true
        }
        return false
    }
    
    // Logic to capture a certain cell for a given piece for level 4 AI
    func canCaptureAt(cell: Int, with piece: Skystone) -> Bool {
        let topIndex = cell - 3
        let bottomIndex = cell + 3
        let leftIndex = cell - 1
        let rightIndex = cell + 1
        
        let topCapture = topIndex >= 0 && board[topIndex]?.owner == 1 && piece.canCapture(board[topIndex]!, direction: .top)
        let bottomCapture = bottomIndex < board.count && board[bottomIndex]?.owner == 1 && piece.canCapture(board[bottomIndex]!, direction: .bottom)
        let leftCapture = cell % 3 != 0 && board[leftIndex]?.owner == 1 && piece.canCapture(board[leftIndex]!, direction: .left)
        let rightCapture = cell % 3 != 2 && board[rightIndex]?.owner == 1 && piece.canCapture(board[rightIndex]!, direction: .right)
        
        return topCapture || bottomCapture || leftCapture || rightCapture
    }
    
    // Logic to simulate a certain move on a copy of the board and return how many stones can be potentially captured, used in order to determine the best possible move for level 5 AI
    func simulateMove(for piece: Skystone, at cell: Int) -> Int {
        var simulatedBoard = board
        simulatedBoard[cell] = piece
        let capturedStones = captureSimulatedStones(at: cell, board: simulatedBoard)
        
        // Calculate the score based on captured stones
        return capturedStones
    }
    
    // Logic to identify all capturable stones at a place in the board for level 5 AI
    func captureSimulatedStones(at index: Int, board: [Skystone?]) -> Int {
        let stone = board[index]!
        var capturedCount = 0
        
        // Capture top stone
        if index >= 3, let topStone = board[index - 3], stone.canCapture(topStone, direction: .top) {
            capturedCount += 1
        }
        
        // Capture bottom stone
        if index <= 5, let bottomStone = board[index + 3], stone.canCapture(bottomStone, direction: .bottom) {
            capturedCount += 1
        }
        
        // Capture left stone
        if index % 3 != 0, let leftStone = board[index - 1], stone.canCapture(leftStone, direction: .left) {
            capturedCount += 1
        }
        
        // Capture right stone
        if index % 3 != 2, let rightStone = board[index + 1], stone.canCapture(rightStone, direction: .right) {
            capturedCount += 1
        }
        
        return capturedCount
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
        
        updateScores()
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
        
        switch selectedDifficulty {
        case 1:
            player2Pieces = level1Pieces
            player1Pieces = player1PiecesForEachDifficulty[0]
        case 2:
            player2Pieces = level2Pieces
            player1Pieces = player1PiecesForEachDifficulty[1]
        case 3:
            player2Pieces = level3Pieces
            player1Pieces = player1PiecesForEachDifficulty[2]
        case 4:
            player2Pieces = level4Pieces
            player1Pieces = player1PiecesForEachDifficulty[3]
        case 5:
            player2Pieces = level5Pieces
            player1Pieces = player1PiecesForEachDifficulty[4]
        case 6:
            player2Pieces = level6Pieces
            player1Pieces = player1PiecesForEachDifficulty[5]
        default:
            player2Pieces = level1Pieces
            player1Pieces = player1PiecesForEachDifficulty[0]
        }
        
        currentPlayer = 1
        isGameOver = false
        winner = nil
        player1Score = 0
        player2Score = 0
    }
    
    func checkGameOver() -> Bool {
        return board.filter { $0 == nil }.isEmpty
    }
    
    func calculateWinner() -> Int {
        let player1Stones = board.filter { $0?.owner == 1 }.count
        let player2Stones = board.filter { $0?.owner == 2 }.count
        return player1Stones > player2Stones ? 1 : 2
    }
    
    func playAudioForDifficulty(audioManager: AudioPlayerManager, level: Int) {
        let musicTrack = musicDifficultyStrings[level]
        audioManager.playAudio(named: musicTrack)
    }
}
