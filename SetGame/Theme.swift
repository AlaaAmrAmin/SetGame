//
//  Theme.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 22/06/2021.
//

import Foundation

struct Theme {
    let shape: Shape
    let numberOfShapes: Int
    
    enum Shape {
        case rectangle(shading: Shading, color: Color)
        case diamond(shading: Shading, color: Color)
        case oval(shading: Shading, color: Color)
        
        var shading: Shading {
            switch self {
                case  let .rectangle(shading, _), let .diamond(shading, _), let .oval(shading, _):
                    return shading
            }
        }
        
        var color: Color {
            switch self {
                case  let .rectangle(_, color), let .diamond(_, color), let .oval(_, color):
                    return color
            }
        }
        
        enum Shading {
            case solid
            case shaded
            case stroked
        }
        
        enum Color {
            case pink
            case purple
            case green
        }
    }
}
