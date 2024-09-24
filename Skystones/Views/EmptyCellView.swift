//
//  EmptyCellView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-20.
//

import SwiftUI

struct EmptyCellView: View {
    var index: Int
    var onTap: () -> Void 
    
    var body: some View {
        Rectangle()
            .foregroundColor(.gray.opacity(0.2))
            .frame(height: 100)
            .onTapGesture {
                onTap()
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

