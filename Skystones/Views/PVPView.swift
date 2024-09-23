//
//  PVPView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import SwiftUI

struct PVPView: View {
    @StateObject var viewModel = GameViewModel()  // Assuming GameViewModel is in its own file
    
    var body: some View {
        ZStack {
            Color.black
            // GIF background stretched to all edges
            GIFView(gifName: "BoardBG")
                .scaledToFit()
                .ignoresSafeArea(.all)
                
            
            // Main game content
            GameBoardView(viewModel: viewModel)
                .navigationTitle("Skystones")
                .padding()
                .background(Color.clear)  // Ensure transparency for the background
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    PVPView()
}




