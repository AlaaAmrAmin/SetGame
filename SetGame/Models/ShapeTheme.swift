//
//  Theme.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 22/06/2021.
//

import Foundation

struct ShapeTheme {
    let shape: Shape
    let numberOfShapes: Int
    
    static func createAllThemeCombinations() -> [ShapeTheme] {
        var combinations = [ShapeTheme]()

        [1, 2, 3].forEach { count in
            ShapeTheme.Shape.Shading.allCases.forEach { shading in
                ShapeTheme.Shape.Color.allCases.forEach { color in
                    combinations.append(ShapeTheme(shape: .rectangle(shading: shading, color: color), numberOfShapes: count))
                    combinations.append(ShapeTheme(shape: .oval(shading: shading, color: color), numberOfShapes: count))
                    combinations.append(ShapeTheme(shape: .diamond(shading: shading, color: color), numberOfShapes: count))
                }
            }
        }
        
        return combinations
    }
    
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
        
        enum Shading: CaseIterable {
            case solid
            case shaded
            case stroked
        }
        
        enum Color: CaseIterable {
            case pink
            case purple
            case green
        }
    }
}
