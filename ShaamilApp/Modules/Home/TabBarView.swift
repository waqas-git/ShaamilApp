//
//  TabBarView.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 28/03/2025.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            // Screens for each tab
            TabView(selection: $selectedTab) {
                Text("Home Screen").tag(0)
                Text("Order Screen").tag(1)
                Text("Wallet Screen").tag(2)
                Text("Settings Screen").tag(3)
            }
            
            // Custom Tab Bar
            HStack {
                TabBarButton(icon: "home_icon", title: "Home", index: 0, selectedTab: $selectedTab)
                TabBarButton(icon: "order_icon", title: "Order", index: 1, selectedTab: $selectedTab)
                
                // Center Floating Points Button
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 60, height: 60)
                        .shadow(radius: 4)
                    
                    Text("500\nPoints")
                        .font(.caption)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .offset(y: -20)
                
                TabBarButton(icon: "wallet_icon", title: "Wallet", index: 2, selectedTab: $selectedTab)
                TabBarButton(icon: "setting_icon_disable", title: "Settings", index: 3, selectedTab: $selectedTab)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            .background(Color.white.shadow(radius: 5))
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    TabBarView()
}
