//
//  AspectVGrid.swift
//  SetGame
//
//  Created by Alaa' Amr Amin on 22/06/2021.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    let items: [Item]
    let itemMinimumWidth: CGFloat
    let aspectRatio: CGFloat
    let content: (Item) -> (ItemView)
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                let width = max(itemMinimumWidth, widthThatBestFits(itemsCount: items.count, in: geometry.size, withAspectRatio: aspectRatio))
                LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing: 0) {
                    ForEach(items) {
                        content($0).aspectRatio(aspectRatio, contentMode: .fit)
                    }
                }
            }
        }
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    private func widthThatBestFits(itemsCount: Int, in size: CGSize, withAspectRatio aspectRatio: CGFloat) -> CGFloat {
        var numberOfColumns: CGFloat = 1
        
        repeat {
            let numberOfRows = CGFloat(itemsCount) / numberOfColumns
            
            let itemWidth = size.width / numberOfColumns
            let itemHeight = itemWidth / aspectRatio
            
            let totalItemsHeight = itemHeight * numberOfRows
            if totalItemsHeight <= size.height {
                return itemWidth
            }
            numberOfColumns += 1
        } while numberOfColumns < CGFloat(itemsCount)
        
        return floor(size.width / numberOfColumns)
    }
}
