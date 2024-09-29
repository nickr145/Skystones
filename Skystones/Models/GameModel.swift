//
//  GameModel.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-21.
//

import Foundation

struct Skystone: Equatable {
    var top: Int
    var right: Int
    var bottom: Int
    var left: Int
    var owner: Int

    func canCapture(_ adjacentStone: Skystone, direction: Direction) -> Bool {
        switch direction {
        case .top:
            return self.top > adjacentStone.bottom
        case .bottom:
            return self.bottom > adjacentStone.top
        case .left:
            return self.left > adjacentStone.right
        case .right:
            return self.right > adjacentStone.left
        }
    }
}

enum Direction {
    case top, bottom, left, right
}
