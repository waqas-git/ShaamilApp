//
//  HeaderViewHome.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//

import SwiftUI

struct HeaderViewHome: View {
    @Binding var itemCount: Int
    var body: some View {
        VStack(spacing: 10){
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Location")
                        .font(.custom(Font.quicksandMedium, size: 13))
                        .foregroundColor(.textGray)
                    
                    HStack(spacing: 2) {
                        Text("Damascus - Sheikh Muhyiddin Mosque")
                            .font(.custom(Font.quicksandRegular, size: 11))
                            .foregroundStyle(.secondaryGreen)
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .resizable()
                            .frame(width: 12, height: 8)
                            .foregroundColor(.secondaryGreen)
                            .padding(.leading, 5)
                    }
                }
                Spacer()
                
                HStack(spacing: 15) {
                    ZStack {
                        Button(action: {
                            // Handle cart action
                        }) {
                            Image("cart_icon")
                                .resizable()
                                .frame(width: 42, height: 42)
                        }
                        
                        Text("\(itemCount)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Circle().fill(Color.red))
                            .offset(x: 12, y: -12)
                    }
                    
                    Image("my_pic")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .clipShape(Circle())
                }
            }
            HStack {
                TextField("Search...", text: .constant(""))
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.lightGrayBg))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.secondaryGreen, lineWidth: 0.5)
                    )
                    .overlay(
                        HStack {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.trailing, 10)
                        }
                    )
            }
        }
    }
}

#Preview {
    @Previewable @State var count: Int = 0
    HeaderViewHome(itemCount: $count)
}
