//
//  SkystoneView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import SwiftUI

struct SkystoneView: View {
    var skystone: Skystone
    
    private enum Constants {
        static let player1Owner = 1
        static let blueOpacity = 0.7
        static let redOpacity = 0.7
        static let tileCornerRadius = 10
    }
    
    var top: some View {
        Text("\(skystone.top)").font(.headline)
            .bold()
    }
    
    var left: some View {
        Text("\(skystone.left)").font(.headline)
            .bold()
    }
    
    var right: some View {
        Text("\(skystone.right)").font(.headline)
            .bold()
    }
    
    var bottom: some View {
        Text("\(skystone.bottom)").font(.headline)
            .bold()
    }
    
    var skystoneTile: some View {
        VStack {
            top
            HStack {
                left
                right
            }
            bottom
        }
        .padding()
        // Blue for Player 1, Red for Player 2
        .background(skystone.owner == Constants.player1Owner ?
                    Color.blue.opacity(Constants.blueOpacity) :
                        Color.red.opacity(Constants.redOpacity))
        .cornerRadius(CGFloat(Constants.tileCornerRadius))
    }
    
    
    
    var body: some View {
        VStack {
            Text("\(skystone.top)").font(.headline)
                .bold()
            HStack {
                Text("\(skystone.left)").font(.headline)
                    .bold()
                Spacer()
                Text("\(skystone.right)").font(.headline)
                    .bold()
            }
            Text("\(skystone.bottom)").font(.headline)
                .bold()
        }
        .padding()
        // Blue for Player 1, Red for Player 2
        .background(skystone.owner == Constants.player1Owner ?
                    Color.blue.opacity(Constants.blueOpacity) :
                        Color.red.opacity(Constants.redOpacity))
        .cornerRadius(CGFloat(Constants.tileCornerRadius))
        
    }
}



#Preview {
    Group {
        SkystoneView(skystone: Skystone(top: 2, right: 3, bottom: 1, left: 4, owner: 1))
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Player 1 Stone")
        
        SkystoneView(skystone: Skystone(top: 3, right: 2, bottom: 4, left: 1, owner: 2))
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Player 2 Stone")
    }
}

