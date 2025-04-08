//
//  HomeScreen.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 29/03/2025.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    @EnvironmentObject var homeCoordinator: HomeCoordinator
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                HeaderViewHome(itemCount: $viewModel.itemCount)
            }
            
            ///Main services
            VStack(alignment: .leading){
                CustomText(text: "Main Services")
                HorizontalScrollView(
                    items: viewModel.serviceItems,
                    cellWidth: UIScreen.main.bounds.width / 4,
                    height: 100
                ) { item in
                    HomeServicesCell(image: item.icon, title: item.title)
                }
            }
            .padding(.top, 20)
            
            ///Use and provide
            VStack(alignment: .leading){
                CustomText(text: "Use and Provide")
                HStack(spacing: 8){
                    DealsCouponCell(title: "Your", subtitle: "DEALS", iconName: "coupon_icon", onTap: {
                        print("DEALS Tapped")
                    })
                        
                    DealsCouponCell(title: "Your", subtitle: "COUPON", iconName: "deal_icon", onTap: {
                        homeCoordinator.push(to: .coupon)
                    })
                }
            }
            .padding(.top, 20)
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    HomeScreen()
}

fileprivate struct CustomText: View {
    var text: String = ""
    var body: some View {
        Text(text)
            .font(.custom(Font.quicksandMedium, size: 18)) // Custom font with medium weight
        //.lineSpacing(24 - 17) // Line height (24) minus font size (17)
            .kerning(0.19) // Letter spacing
            .foregroundColor(Color.black.opacity(0.8)) // Color with 80% opacity
    }
}
