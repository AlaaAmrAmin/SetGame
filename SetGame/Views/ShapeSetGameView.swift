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
            AspectVGrid(items: game.cards, itemMinimumWidth: DrawingConstants.cardMinimumWidth, aspectRatio: DrawingConstants.cardAspectRatio) { card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.selectCard(card)
                    }
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
        let colorOpacity = isDisabled ? DrawingConstants.disabledButtonColorOpacity : 1
        return Button(action: {
            game.dealThreeMoreCards()
        }, label: {
            Text("Deal 3 More Cards")
                .font(.title2)
                .padding()
        })
        .disabled(isDisabled)
        .background(
            RoundedRectangle(cornerRadius: DrawingConstants.buttonCornerRadius)
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
        .background(RoundedRectangle(cornerRadius: DrawingConstants.buttonCornerRadius)
                        .foregroundColor(.yellow))
    }
    
    private struct DrawingConstants {
        static let cardMinimumWidth: CGFloat = 60
        static let cardAspectRatio: CGFloat = 2/3
        static let buttonCornerRadius: CGFloat = 6
        static let disabledButtonColorOpacity: Double = 0.5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame(allCardsContent: ShapeTheme.createAllThemeCombinations(), displayedCardsCount: Constants.initialNumberOfCards)
        let gameViewModel = SetGameViewModel(game: game)
        ShapeSetGameView(game: gameViewModel)
    }
}
