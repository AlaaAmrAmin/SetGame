//
//  SetGameApp.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 21/06/2021.
//

import SwiftUI

@main
struct SetGameApp: App {
    var body: some Scene {
        WindowGroup {
            let game = SetGame(allCardsContent: ShapeTheme.createAllThemeCombinations(), displayedCardsCount: Constants.initialNumberOfCards)
            let gameViewModel = SetGameViewModel(game: game)
            ShapeSetGameView(game: gameViewModel)
        }
    }
}
