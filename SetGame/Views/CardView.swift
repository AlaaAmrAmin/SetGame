//
//  CardView.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 23/06/2021.
//

import SwiftUI

struct CardView: View {
    let card: SetGame<ShapeTheme>.Card
    var backgroundColor: Color {
        guard card.status == .selected else { return .white }
        return Color.yellow.opacity(DrawingConstants.selectedStateBackgroundColorOpacity)
    }
    
    var borderColor: Color {
        guard card.status == .unmatched else { return Color.gray.opacity(DrawingConstants.defaultBorderColorOpacity) }
        return Color.red
    }
    
    var body: some View {
        GeometryReader { geometry in
            let size = CGSize(width: geometry.size.width * DrawingConstants.shapeContainerSizePercentage, height: geometry.size.height * DrawingConstants.shapeContainerSizePercentage)
            ZStack {
                let rectangle =  RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                rectangle.foregroundColor(backgroundColor)
                rectangle.strokeBorder(borderColor, lineWidth: DrawingConstants.borderWidth)
                
                VStack {
                    let content = card.content
                    ForEach((1 ... content.numberOfShapes), id: \.self) { _ in
                        ShapeView(shape: content.shape, aspectRatio: DrawingConstants.shapeAspectRatio)
                            .foregroundColor(content.shape.color.colorValue)
                    }
                    
                }
                .frame(width: size.width, height: size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    private struct DrawingConstants {
        static let selectedStateBackgroundColorOpacity: Double = 0.2
        static let defaultBorderColorOpacity: Double = 0.5
        static let cornerRadius: CGFloat = 10
        static let borderWidth: CGFloat = 2
        static let shapeContainerSizePercentage: CGFloat = 0.7
        static let shapeAspectRatio: CGFloat = 2/1
    }
}

fileprivate extension ShapeTheme.Shape.Color {
    var colorValue: SwiftUI.Color {
        switch self {
            case .green:
                return .green
                
            case .pink:
                return .pink
                
            case .purple:
                return .purple
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let content = ShapeTheme(shape: ShapeTheme.Shape(symbol: .diamond, shading: .stroked, color: .pink), numberOfShapes: 3)
        CardView(card: SetGame<ShapeTheme>.Card(id: 1, content: content))
    }
}
