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
    let iconWidth: CGFloat = 24
    let iconHeight: CGFloat = 24
    @Binding var selectedTab: Int
    
    var body: some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack {
                Image(icon)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(selectedTab == index ? .accent : Color.grayImageColor)
                
                Text(title)
                    .font(.custom(Font.quicksandRegular, size: 11))
                    .foregroundColor(selectedTab == index ? .accent : Color.grayImageColor)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    TabBarButton(icon: ("setting_icon_disable"), title: "Home", index: 1, selectedTab: .constant(0))
}
