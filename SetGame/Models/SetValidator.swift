//
//  SetValidator.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 24/06/2021.
//

import Foundation

protocol SetValidator {
    associatedtype Element
    
    static func isSet(_ elements: [Element]) -> Bool
}

extension SetValidator {
    static func isFeatureASet<T: Equatable>(in elements: [Element], feature: KeyPath<Element, T>) -> Bool {
        guard elements.count > 0 else { return false }
        
        let hasSameFeatureValues = elements.dropFirst().allSatisfy { $0[keyPath: feature] == elements[0][keyPath: feature] }
        let hasDifferentFeatureValues = elements.dropFirst().allSatisfy { $0[keyPath: feature] != elements[0][keyPath: feature] }
        
        return hasSameFeatureValues || hasDifferentFeatureValues
    }
}
