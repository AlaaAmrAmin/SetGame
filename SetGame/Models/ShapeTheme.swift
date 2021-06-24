//
//  Theme.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 22/06/2021.
//

import Foundation

struct ShapeTheme: SetValidator {
    let shape: Shape
    let numberOfShapes: Int
    
    static func createAllThemeCombinations() -> [ShapeTheme] {
        var combinations = [ShapeTheme]()

        [1, 2, 3].forEach { count in
            ShapeTheme.Shape.Symbol.allCases.forEach { symbol in
                ShapeTheme.Shape.Shading.allCases.forEach { shading in
                    ShapeTheme.Shape.Color.allCases.forEach { color in
                        combinations.append(ShapeTheme(shape: Shape(symbol: symbol, shading: shading, color: color), numberOfShapes: count))
                    }
                }
            }
        }
        
        return combinations
    }
    
    static func isSet(_ shapes: [ShapeTheme]) -> Bool {
        guard isFeatureASet(in: shapes, feature: \.numberOfShapes) else { return false }
        guard Shape.isSet(shapes.map { $0.shape }) else { return false }
        
        return true
    }
}

extension ShapeTheme {

    struct Shape: SetValidator {
        let symbol: Symbol
        let shading: Shading
        let color: Color
        
        enum Symbol: CaseIterable {
            case rectangle
            case diamond
            case oval
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
        
        static func isSet(_ elements: [ShapeTheme.Shape]) -> Bool {
            guard isFeatureASet(in: elements, feature: \.symbol) else { return false }
            guard isFeatureASet(in: elements, feature: \.shading) else { return false }
            guard isFeatureASet(in: elements, feature: \.color) else { return false }
            
            return true
        }
    }
}
