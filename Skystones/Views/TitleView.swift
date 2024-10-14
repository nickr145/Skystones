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
    @State private var showInstructionsView = false

    var body: some View {
        ZStack {
            Color.black
            
            GIFView(gifName: "portal")
                .scaledToFit()
                .ignoresSafeArea()
                .frame(width: 500, height: 500)
            
            GeometryReader { geometry in
                VStack {
                    Spacer()  // Push the image to the center vertically

                    Image("skystones-LC")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: min(geometry.size.width * 0.6, 300),  // Adjust based on screen width, with a max size of 300
                               height: min(geometry.size.width * 0.6, 300))
                        .ignoresSafeArea()

                    Spacer()  // Push the image to the center vertically
                }
                .frame(width: geometry.size.width, height: geometry.size.height)  // Full screen frame
            }
            
            VStack(spacing: 50) {
                Text("")
                Text("")
                Text("")
                Text("")
                Text("")
                Text("")
                //Text("")

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
                
                // New Instructions Button
                Button(action: {
                    showInstructionsView = true
                }) {
                    Text("Instructions")
                        .font(.title2)
                        .padding()
                        .background(Color.orange)
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
            .fullScreenCover(isPresented: $showInstructionsView) {
                InstructionsView()
            }
        }
        .ignoresSafeArea()
    }
}


#Preview {
    TitleView()
}
