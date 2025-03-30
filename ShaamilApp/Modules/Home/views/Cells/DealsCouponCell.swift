//
//  DealsCouponCell.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//

import SwiftUI

struct DealsCouponCell: View {
    let title: String
    let subtitle: String
    let iconName: String
    let onTap: ()-> Void
    
    var body: some View {
        HStack(spacing: 10) {
            
            Image(iconName) // Replace with a custom image if needed
                .resizable()
                .scaledToFit()
                .frame(width: 65, height: 65)
                .foregroundColor(.white)
                .offset(x: -10) // Move left to match the circle
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.custom(Font.quicksandMedium, size: 16))
                    .foregroundColor(.secondaryGreen)
                    .kerning(0.22)
                
                Text(subtitle)
                    .font(.custom(Font.quicksandMedium, size: 18))
                    .foregroundColor(.secondaryGreen)
                    .kerning(0.22)
            }
            .offset(x: -10)
            
            Spacer()
        }
        .padding(.horizontal, -10)
        .frame(height: 60)
        .background(
            RoundedRectangle(cornerRadius: 3) // Border with 3px corner radius
                .fill(Color.secondaryGreen.opacity(0.2)) // Light blue background
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.secondaryGreen.opacity(0.9), lineWidth: 0.5) // Border
                )
        )
        .padding(.leading, 20) // Small spacing between items
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    HStack(spacing: 10){
        DealsCouponCell(title: "Your", subtitle: "DEALS", iconName: "coupon_icon", onTap: {
        })
        DealsCouponCell(title: "Your", subtitle: "COUPON", iconName: "deal_icon", onTap: {
        })
    }
    .padding()
}
