//
//  PVPView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import SwiftUI

struct PVPView: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            Color.black

            GIFView(gifName: "BoardBG")
                .scaledToFit()
                .ignoresSafeArea(.all)
                
            GameBoardView(viewModel: viewModel)
                .navigationTitle("Skystones")
                .padding()
                .background(Color.clear)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    PVPView()
}




