//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 22/06/2021.
//

import Foundation

class SetGameViewModel: ObservableObject {
    typealias Card = SetGame<ShapeTheme>.Card
    
    @Published private var game: SetGame<ShapeTheme>
    
    var cards: [Card] { game.displayedCards }
    var hasDealtAllCards: Bool { cards.count == game.allCards.count }
    
    init(game: SetGame<ShapeTheme>) {
        self.game = game
    }
    
    func selectCard(_ card: Card) {
        game.selectCard(card)
    }
    
    func dealThreeMoreCards() {
        game.dealMoreCards(count: 9)
    }
    
    func startNewGame() {
        game = SetGame(allCardsContent: ShapeTheme.createAllThemeCombinations(), displayedCardsCount: Constants.initialNumberOfCards)
    }
}
