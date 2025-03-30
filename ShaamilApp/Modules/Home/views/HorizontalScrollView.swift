//
//  HorizontalListWithItems.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//
import SwiftUI
struct HorizontalScrollView<Item: Hashable, Content: View>: View {
    let items: [Item]
    let cellWidth: CGFloat
    let height: CGFloat
    let content: (Item) -> Content
    
    init(
        items: [Item],
        cellWidth: CGFloat,
        height: CGFloat,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.cellWidth = cellWidth
        self.height = height
        self.content = content
    }
    
    var body: some View {
        GeometryReader { _ in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(items, id: \.self) { item in
                        content(item)
                            .frame(width: cellWidth)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .frame(height: height)
    }
}
