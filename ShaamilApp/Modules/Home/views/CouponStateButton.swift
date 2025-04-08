//
//  CouponStateButton.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 04/04/2025.
//

import SwiftUI

struct CouponStateButton: View {
    var title: String
    @Binding var selectedOption: String?
    var isSelected: Bool {
        selectedOption == title
    }
    
    var body: some View {
        Button(action: {
            selectedOption = title
        }) {
            Text(title)
                .font(.custom(Font.quicksandMedium, size: 14))
                .padding()
                .frame(minWidth: 100, minHeight: 30)
                .foregroundColor(isSelected ? .white : .textGray)
                .background(isSelected ? Color.accentColor : Color.grayBg.opacity(0.1))
                .cornerRadius(8)
                .overlay( RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color.textGray.opacity(0.46) : Color.textGray.opacity(0.26)))
        }
    }
}

//#Preview {
//    CouponStateButton()
//}
