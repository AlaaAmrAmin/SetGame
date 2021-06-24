//
//  SetGame.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 22/06/2021.
//

import Foundation

struct SetGame<CardContent: SetValidator> {
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
    
    mutating func selectCard(_ card: Card) {
        guard card.status != .unmatched else { return }
        
        guard let cardIndex = allCards.firstIndex(where: { $0.id == card.id }) else { return }
        
        let newStatus: Card.Status = card.status == .unselected ? .selected : .unselected
        allCards[cardIndex].status = newStatus
        
        resetUnmatchedCards()
        
        let selectedCards = cards(withStatus: .selected)
        if selectedCards.count == 3 {
            let isASet = doesSelectedCardsFormASet(selectedCards.map { $0.card })
            
            if isASet {
                removeCards(selectedCards.map { $0.card })
            }
            else {
                updateCardsStatus(at: selectedCards.map({ $0.index }), to: .unmatched)
            }
        }
    }
    
    private func cards(withStatus status: Card.Status) -> [(index: Int, card: Card)] {
        allCards.enumerated().compactMap {
            $0.element.status == status ? ($0.offset, $0.element) : nil
        }
    }
    
    private mutating func resetUnmatchedCards() {
        let unmatchedCardsIndices = cards(withStatus: .unmatched).map { $0.index}
        guard unmatchedCardsIndices.count > 0 else { return }
        
        updateCardsStatus(at: unmatchedCardsIndices, to: .unselected)
    }
    
    private mutating func updateCardsStatus(at cardsIndices: [Int], to status: Card.Status) {
        cardsIndices.forEach {
            allCards[$0].status = status
        }
    }
    
    private func doesSelectedCardsFormASet(_ selectedCards: [Card]) -> Bool {
        guard selectedCards.count == 3 else { return false }
        
        let selectedContents = selectedCards.map { $0.content }
        return CardContent.isSet(selectedContents as! [CardContent.Element])
    }
    
    private mutating func removeCards(_ cards: [Card]) {
        cards.forEach { card in
            allCards.removeAll { $0.id == card.id }
        }
        
        if displayedCardsCount > allCards.count {
            displayedCardsCount = allCards.count
        }
    }
    
    struct Card: Identifiable {
        let id: Int
        let content: CardContent
        var status = Status.unselected
        
        enum Status {
            case unselected
            case selected
            case matched
            case unmatched
        }
    }
}
