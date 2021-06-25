//
//  ShapeView.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 22/06/2021.
//

import SwiftUI

struct ShapeView: View {
    let shape: ShapeTheme.Shape
    let aspectRatio: CGFloat
    
    var body: some View {
        switch shape.symbol {
            case .rectangle:
                applyShading(to: Rectangle()).aspectRatio(aspectRatio, contentMode: .fit)
                
            case .oval:
                applyShading(to: Capsule()).aspectRatio(aspectRatio, contentMode: .fit)
                
            case .diamond:
                applyShading(to: Diamond(aspectRatio: aspectRatio))
        }
    }
    
    @ViewBuilder
    private func applyShading<T: InsettableShape>(to shapeView: T) -> some View {
        switch shape.shading {
            case .solid:
                shapeView

            case .stroked:
                shapeView.strokeBorder(lineWidth: DrawingConstants.borderWidth)

            case .shaded:
                shapeView.strokeBorder(lineWidth: DrawingConstants.borderWidth).background(shapeView.opacity(DrawingConstants.shadingOpacity))
        }
    }
    
    private struct DrawingConstants {
        static let borderWidth: CGFloat = 3
        static let shadingOpacity: Double = 0.3
    }
}

struct ShapeView_Previews: PreviewProvider {
    typealias Shape = ShapeTheme.Shape
    static var previews: some View {
        VStack {
            HStack {
                ShapeView(shape: Shape(symbol: .rectangle, shading: .solid, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: Shape(symbol: .rectangle, shading: .stroked, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: Shape(symbol: .rectangle, shading: .shaded, color: .pink), aspectRatio: 2/1)
            }
                        
            HStack {
                ShapeView(shape: Shape(symbol: .rectangle, shading: .solid, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: Shape(symbol: .rectangle, shading: .stroked, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: Shape(symbol: .rectangle, shading: .shaded, color: .pink), aspectRatio: 2/1)
            }
            
            HStack {
                ShapeView(shape: Shape(symbol: .diamond, shading: .solid, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: Shape(symbol: .diamond, shading: .stroked, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: Shape(symbol: .diamond, shading: .shaded, color: .pink), aspectRatio: 2/1)
            }
        }
    }
}
