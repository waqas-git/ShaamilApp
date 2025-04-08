//
//  CouponCell.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 04/04/2025.
//

import SwiftUI

struct CouponCell: View {
    var buttonTitle: String = "Activation"
    var title: String = "Food Vouchers"
    var subTitle: String = "You have a 20% discount"
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text(title)
                    .font(.custom(Font.quicksandMedium, size: 15))
                    .foregroundStyle(Color.textGray)
                Text(subTitle)
                    .font(.custom(Font.quicksandRegular, size: 11))
                    .foregroundStyle(Color.textGray)
            }
            Spacer()
            Button(action: {
            }) {
                Text(buttonTitle)
                    .font(.custom(Font.quicksandMedium, size: 14))
                    .frame(minWidth: 100, minHeight: 35)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(8)
                    .overlay( RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.textGray.opacity(0.46)))
            }
        }
        .padding()
        .background(Color.white)
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.black.opacity(1), lineWidth: 0.3)
                )
                .shadow(color: Color.black.opacity(0.09), radius: 6, x: 0, y: 3)
                .opacity(0.72)
    }
}

#Preview {
    CouponCell()
}
