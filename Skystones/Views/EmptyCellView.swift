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
    
    private enum Constants {
        static let rectangleForegroundColorOpacity = 0.2
        static let rectangleHeight = 100
    }
    
    var rectangleView: some View {
        Rectangle()
            .foregroundColor(.gray.opacity(Constants.rectangleForegroundColorOpacity))
            .frame(height: CGFloat(Constants.rectangleHeight))
            .onTapGesture {
                onTap()
            }
    }
    
    var body: some View {
        rectangleView
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

