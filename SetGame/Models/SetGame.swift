//
//  SetGame.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 22/06/2021.
//

import Foundation

struct SetGame<CardContent> {
    var displayedCards: [Card] {
        Array(allCards[0 ..< displayedCardsCount])
    }
    private(set) var allCards: [Card]
    private var displayedCardsCount: Int
    
    init(allCardsContent: [CardContent], displayedCardsCount: Int) {
        self.displayedCardsCount = displayedCardsCount
        self.allCards = [Card]()
        for (index, content) in allCardsContent.shuffled().enumerated() {
            let card = Card(id: index, content: content)
            allCards.append(card)
        }
    }
    
    mutating func dealMoreCards(count: Int) {
        if displayedCardsCount + count <= allCards.count {
            displayedCardsCount += count
        }
        else {
            displayedCardsCount = allCards.count
        }
    }
    
    struct Card: Identifiable {
        let id: Int
        let content: CardContent
    }
}
