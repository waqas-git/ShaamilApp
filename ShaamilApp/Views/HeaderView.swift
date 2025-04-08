//
//  HeaderView.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    var foregroundColor: Color?
    var onBack: (() -> Void)?

    var body: some View {
        ZStack {
            Text(title)
                .font(.custom(Font.quicksandRegular, size: 23))
                .foregroundColor((foregroundColor != nil) ? foregroundColor : Color.textGray)
                //.padding(.top, 8)

            HStack {
                if let onBack = onBack {
                    Button(action: onBack) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.secondaryGreen)
                            .clipShape(Circle())
                    }
                    .frame(width: 40, height: 40)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    HeaderView(title: "Settings")
}
