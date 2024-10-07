//
//  PVPView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import SwiftUI

struct PVPView: View {
    @StateObject var viewModel = GameViewModel()
    @Environment(\.dismiss) var dismiss  // For dismissing the view
    
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
            
            VStack {
                Spacer()
                // Back button
                Button(action: {
                    dismiss()  // Dismiss the current view to return to TitleView
                }) {
                    Text("Back to Title Screen")
                        .font(.footnote)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(100)
                        .padding(.bottom,10)
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    PVPView()
}




