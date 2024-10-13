//
//  InstructionsView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-10-12.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [.blue, .purple, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    
                    // Title with shadow
                    HStack(spacing: 20) {
                        // Title with shadow
                        Text("Skystones Instructions")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)
                        
                        // Skystone view next to title
                        SkystoneView(skystone: Skystone(top: 2, right: 3, bottom: 1, left: 4, owner: 1))
                            .frame(width: 100, height: 60)  // Adjust size if needed
                            .padding(.leading, 10)
                    }
                    .padding(.horizontal)

                    
                    // Objective section with icon
                    HStack(spacing: 10) {
                        Image(systemName: "target")
                            .foregroundColor(.yellow)
                            .font(.title2)
                        
                        Text("Objective")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.yellow)
                    }
                    
                    Text("Capture as many stones as possible by strategically placing your pieces on the board.")
                        .foregroundColor(.white)
                        .font(.body)
                        .padding(.bottom, 5)
                        .multilineTextAlignment(.leading)
                    
                    // How to play section with bullet points and icon
                    HStack(spacing: 10) {
                        Image(systemName: "gamecontroller.fill")
                            .foregroundColor(.green)
                            .font(.title2)
                        
                        Text("How to Play")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.green)
                    }
                    
                    Text("""
                    - Players take turns placing their stones on the 3x3 board.
                    - Each stone has values on all four sides.
                    - When placed adjacent to an opponent’s stone, the values of the touching sides are compared.
                    - If your stone's side value is higher than the opponent’s, you capture their stone.
                    """)
                    .foregroundColor(.white)
                    .font(.body)
                    .padding(.bottom, 5)
                    .multilineTextAlignment(.leading)
                    
                    // Winning section with icon
                    HStack(spacing: 10) {
                        Image(systemName: "trophy.fill")
                            .foregroundColor(.orange)
                            .font(.title2)
                        
                        Text("Winning the Game")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.orange)
                    }
                    
                    Text("The game ends when the board is full. The player who controls the most stones at the end of the game wins.")
                        .foregroundColor(.white)
                        .font(.body)
                        .padding(.bottom, 5)
                        .multilineTextAlignment(.leading)
                    
                    // Additional rules section with icon
                    HStack(spacing: 10) {
                        Image(systemName: "list.bullet.rectangle")
                            .foregroundColor(.red)
                            .font(.title2)
                        
                        Text("Additional Rules")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.red)
                    }
                    
                    Text("""
                    - If a player cannot place a stone, the turn is skipped.
                    - In Player vs Computer mode, the AI will automatically place a stone after Player 1’s turn.
                    """)
                    .foregroundColor(.white)
                    .font(.body)
                    .multilineTextAlignment(.leading)

                    // Spacing for scrolling
                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("Instructions")
        .navigationBarTitleDisplayMode(.inline)  // Optional to reduce title size
    }
}

#Preview {
    InstructionsView()
}
