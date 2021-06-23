//
//  GameView.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 21/06/2021.
//

import SwiftUI

struct ShapeSetGameView: View {
    @ObservedObject var game: SetGameViewModel
    
    var body: some View {
        VStack {
            AspectVGrid(items: game.cards, itemMinimumWidth: 60, aspectRatio: 2/3) {
                CardView(card: $0)
                    .padding(4)
            }
            .padding(.horizontal)
            
            Divider()
            
            VStack {
                dealMoreCardsButton(isDisabled: game.hasDealtAllCards)
                Divider()
                newGameButton
            }
            .padding(.horizontal)
            .foregroundColor(.white)
            
        }
    }
    
    private func dealMoreCardsButton(isDisabled: Bool) -> some View {
        let colorOpacity = isDisabled ? 0.5 : 1
        return Button(action: {
            game.dealThreeMoreCards()
        }, label: {
            Text("Deal 3 More Cards")
                .font(.title2)
                .padding()
        })
        .disabled(isDisabled)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.yellow)
                .opacity(colorOpacity)
        )
    }
    
    private var newGameButton: some View {
        Button(action: {
            game.startNewGame()
        }, label: {
            Text("New Game")
                .font(.title2)
                .padding()
        })
        .background(RoundedRectangle(cornerRadius: 6).foregroundColor(.yellow))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame(allCardsContent: ShapeTheme.createAllThemeCombinations(), displayedCardsCount: Constants.initialNumberOfCards)
        let gameViewModel = SetGameViewModel(game: game)
        ShapeSetGameView(game: gameViewModel)
    }
}
