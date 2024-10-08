//
//  SkystoneView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import SwiftUI

struct SkystoneView: View {
    var skystone: Skystone
    
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
        .background(skystone.owner == 1 ? Color.blue.opacity(0.7) : Color.red.opacity(0.7))
        .cornerRadius(10)
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

