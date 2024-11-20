//
//  PlayerPiecesModel.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-11-18.
//

import Foundation

class PlayerPiecesModel: ObservableObject {
    @Published var player1Pieces: [Skystone] = [
        Skystone(top: 3, right: 2, bottom: 3, left: 2, owner: 1),
        Skystone(top: 2, right: 3, bottom: 2, left: 3, owner: 1),
        Skystone(top: 4, right: 1, bottom: 3, left: 2, owner: 1),
        Skystone(top: 2, right: 4, bottom: 2, left: 3, owner: 1),
        Skystone(top: 3, right: 3, bottom: 2, left: 3, owner: 1)
    ]
    @Published var player2Pieces: [Skystone] = [
        Skystone(top: 3, right: 2, bottom: 3, left: 2, owner: 2),
        Skystone(top: 2, right: 3, bottom: 2, left: 3, owner: 2),
        Skystone(top: 4, right: 1, bottom: 3, left: 2, owner: 2),
        Skystone(top: 2, right: 4, bottom: 2, left: 3, owner: 2),
        Skystone(top: 3, right: 3, bottom: 2, left: 3, owner: 2)
    ]
    @Published var level1Pieces: [Skystone] = [
        Skystone(top: 1, right: 0, bottom: 1, left: 2, owner: 2),
        Skystone(top: 1, right: 1, bottom: 0, left: 2, owner: 2),
        Skystone(top: 0, right: 2, bottom: 1, left: 1, owner: 2),
        Skystone(top: 1, right: 1, bottom: 2, left: 0, owner: 2),
        Skystone(top: 2, right: 0, bottom: 1, left: 1, owner: 2)
    ]
    @Published var level2Pieces: [Skystone] = [
        Skystone(top: 2, right: 1, bottom: 2, left: 2, owner: 2),
        Skystone(top: 2, right: 2, bottom: 1, left: 2, owner: 2),
        Skystone(top: 1, right: 3, bottom: 2, left: 1, owner: 2),
        Skystone(top: 2, right: 2, bottom: 2, left: 1, owner: 2),
        Skystone(top: 3, right: 1, bottom: 2, left: 2, owner: 2)
    ]
    @Published var level3Pieces: [Skystone] = [
        Skystone(top: 3, right: 2, bottom: 3, left: 1, owner: 2),
        Skystone(top: 2, right: 3, bottom: 1, left: 3, owner: 2),
        Skystone(top: 3, right: 3, bottom: 2, left: 1, owner: 2),
        Skystone(top: 4, right: 3, bottom: 3, left: 2, owner: 2),
        Skystone(top: 2, right: 4, bottom: 3, left: 2, owner: 2)
    ]
    @Published var level4Pieces: [Skystone] = [
        Skystone(top: 3, right: 4, bottom: 2, left: 3, owner: 2),
        Skystone(top: 4, right: 3, bottom: 4, left: 1, owner: 2),
        Skystone(top: 3, right: 4, bottom: 3, left: 2, owner: 2),
        Skystone(top: 4, right: 2, bottom: 3, left: 4, owner: 2),
        Skystone(top: 3, right: 3, bottom: 4, left: 3, owner: 2)
    ]
    @Published var level5Pieces: [Skystone] = [
        Skystone(top: 3, right: 4, bottom: 3, left: 4, owner: 2),
        Skystone(top: 4, right: 2, bottom: 4, left: 3, owner: 2),
        Skystone(top: 3, right: 4, bottom: 3, left: 4, owner: 2),
        Skystone(top: 0, right: 3, bottom: 4, left: 4, owner: 2),
        Skystone(top: 4, right: 4, bottom: 2, left: 4, owner: 2)
    ]
    @Published var level6Pieces: [Skystone] = [
        Skystone(top: 3, right: 3, bottom: 3, left: 4, owner: 2),
        Skystone(top: 3, right: 4, bottom: 5, left: 3, owner: 2),
        Skystone(top: 4, right: 4, bottom: 4, left: 4, owner: 2),
        Skystone(top: 5, right: 3, bottom: 3, left: 3, owner: 2),
        Skystone(top: 3, right: 4, bottom: 4, left: 4, owner: 2),
    ]
    
    @Published var player1PiecesForEachDifficulty: [[Skystone]] = [
        [Skystone(top: 1, right: 2, bottom: 1, left: 0, owner: 1),
         Skystone(top: 2, right: 1, bottom: 2, left: 0, owner: 1),
         Skystone(top: 1, right: 3, bottom: 0, left: 1, owner: 1),
         Skystone(top: 2, right: 2, bottom: 1, left: 1, owner: 1),
         Skystone(top: 1, right: 2, bottom: 1, left: 2, owner: 1)
        ],
        [Skystone(top: 2, right: 3, bottom: 1, left: 2, owner: 1),
         Skystone(top: 3, right: 2, bottom: 1, left: 1, owner: 1),
         Skystone(top: 2, right: 2, bottom: 2, left: 0, owner: 1),
         Skystone(top: 1, right: 3, bottom: 3, left: 1, owner: 1),
         Skystone(top: 2, right: 2, bottom: 3, left: 1, owner: 1)
        ],
        [Skystone(top: 2, right: 3, bottom: 2, left: 2, owner: 1),
         Skystone(top: 3, right: 3, bottom: 1, left: 2, owner: 1),
         Skystone(top: 3, right: 1, bottom: 3, left: 2, owner: 1),
         Skystone(top: 2, right: 3, bottom: 2, left: 2, owner: 1),
         Skystone(top: 1, right: 2, bottom: 3, left: 1, owner: 1)
        ],
        [Skystone(top: 3, right: 2, bottom: 3, left: 1, owner: 1),
         Skystone(top: 2, right: 3, bottom: 3, left: 2, owner: 1),
         Skystone(top: 4, right: 3, bottom: 2, left: 2, owner: 1),
         Skystone(top: 1, right: 2, bottom: 3, left: 2, owner: 1),
         Skystone(top: 2, right: 1, bottom: 4, left: 2, owner: 1)
        ],
        [Skystone(top: 3, right: 3, bottom: 3, left: 2, owner: 1),
         Skystone(top: 1, right: 3, bottom: 4, left: 1, owner: 1),
         Skystone(top: 2, right: 2, bottom: 3, left: 3, owner: 1),
         Skystone(top: 3, right: 3, bottom: 3, left: 3, owner: 1),
         Skystone(top: 2, right: 4, bottom: 4, left: 3, owner: 1)
        ],
        [Skystone(top: 3, right: 3, bottom: 4, left: 3, owner: 1),
         Skystone(top: 4, right: 4, bottom: 4, left: 3, owner: 1),
         Skystone(top: 3, right: 3, bottom: 3, left: 3, owner: 1),
         Skystone(top: 4, right: 3, bottom: 4, left: 3, owner: 1),
         Skystone(top: 3, right: 4, bottom: 3, left: 3, owner: 1)
        ]
    ]
}
