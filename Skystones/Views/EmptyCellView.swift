//
//  EmptyCellView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import SwiftUI

struct EmptyCellView: View {
    var index: Int
    var onTap: () -> Void  // Closure to handle tap action
    
    var body: some View {
        Rectangle()
            .foregroundColor(.gray.opacity(0.2))  // Light gray color for empty cells
            .frame(height: 100)  // Adjust height for design
            .overlay(Text("\(index)").foregroundColor(.gray))  // Optional: show index for debugging
            .onTapGesture {
                onTap()  // Trigger the tap action
            }
    }
}




#Preview {
    Group {
        EmptyCellView(index: 0, onTap: { print("Tapped on empty cell 0") })
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Empty Cell 0")
        
        EmptyCellView(index: 1, onTap: { print("Tapped on empty cell 1") })
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Empty Cell 1")
    }
}

