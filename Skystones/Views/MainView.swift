//
//  MainView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = GameViewModel()  // Assuming GameViewModel is in its own file
    
    var body: some View {
        NavigationView { 
            GameBoardView(viewModel: viewModel)  // Using GameBoardView with the view model
                .navigationTitle("Skystones")
                .padding()
        }
    }
}

#Preview {
    MainView()
}

