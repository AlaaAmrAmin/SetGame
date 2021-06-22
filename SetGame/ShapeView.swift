//
//  ShapeView.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 22/06/2021.
//

import SwiftUI

struct ShapeView: View {
    let shape: Theme.Shape
    let aspectRatio: CGFloat
    
    var body: some View {
        switch shape {
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
                shapeView.strokeBorder(lineWidth: 3)

            case .shaded:
                shapeView.strokeBorder(lineWidth: 3).background(shapeView.opacity(0.3))
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                ShapeView(shape: .rectangle(shading: .solid, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: .rectangle(shading: .stroked, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: .rectangle(shading: .shaded, color: .pink), aspectRatio: 2/1)
            }
                        
            HStack {
                ShapeView(shape: .oval(shading: .solid, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: .oval(shading: .stroked, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: .oval(shading: .shaded, color: .pink), aspectRatio: 2/1)
            }
            
            HStack {
                ShapeView(shape: .diamond(shading: .solid, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: .diamond(shading: .stroked, color: .pink), aspectRatio: 2/1)
                ShapeView(shape: .diamond(shading: .shaded, color: .pink), aspectRatio: 2/1)
            }
        }
    }
}
