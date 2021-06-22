//
//  Diamond.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 22/06/2021.
//

import SwiftUI

struct Diamond: Shape {
    let aspectRatio: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let verticalDistanceFromCenterToCorner = rect.width / (2 * aspectRatio)
        let topCorner = CGPoint(x: center.x, y: center.y - verticalDistanceFromCenterToCorner)
        let bottomCorner = CGPoint(x: center.x, y: center.y + verticalDistanceFromCenterToCorner)
        
        
        let horizontalDistanceFromCenterToCorner = rect.width / 2
        let leftCorner = CGPoint(x: center.x - horizontalDistanceFromCenterToCorner, y: center.y)
        let rightCorner = CGPoint(x: center.x + horizontalDistanceFromCenterToCorner, y: center.y)
        
        var path = Path()
        path.move(to: topCorner)
        path.addLines([topCorner, leftCorner, bottomCorner, rightCorner, topCorner])
        
        return path
    }
}

struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        Diamond(aspectRatio: 2/1)
    }
}
