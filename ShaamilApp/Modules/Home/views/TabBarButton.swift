//
//  TabBarButton.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 28/03/2025.
//

import SwiftUI

struct TabBarButton: View {
    let icon: String
    let title: String
    let index: Int
    let iconWidth: CGFloat = 20
    let iconHeight: CGFloat = 20
    @Binding var selectedTab: Int
    
    var body: some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: iconWidth, height: iconHeight)
                    .foregroundColor(selectedTab == index ? .accent : Color.grayImageColor)
                    .clipped()
                
                Text(title)
                    .font(.custom(Font.quicksandRegular, size: 11))
                    .foregroundColor(selectedTab == index ? .accent : Color.grayImageColor)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    TabBarButton(icon: ("settings_icon"), title: "Home", index: 1, selectedTab: .constant(0))
}
