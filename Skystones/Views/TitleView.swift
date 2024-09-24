//
//  TitleView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-22.
//

import SwiftUI

struct TitleView: View {
    @State private var showPVPView = false
    @State private var showPVCView = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to Skystones")
                .font(.largeTitle)
                .bold()

            Button(action: {
                showPVPView = true
            }) {
                Text("PVP (Player vs Player)")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: {
                // Handle PVC logic here
                showPVCView = true
            }) {
                Text("PVC (Player vs Computer)")
                    .font(.title2)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .fullScreenCover(isPresented: $showPVPView) {
            PVPView()
        }
        .fullScreenCover(isPresented: $showPVCView) {
            PVCView() 
        }
    }
}


#Preview {
    TitleView()
}
