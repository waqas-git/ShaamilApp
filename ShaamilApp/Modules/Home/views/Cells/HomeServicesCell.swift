//
//  HomeServicesCell.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//

import SwiftUI

struct HomeServicesCell: View {
    var image: String
    var title: String
    var imageHeight: CGFloat = 120
    var body: some View {
        VStack() {
            ZStack{
                Rectangle()
                    .foregroundStyle(Color.accentColor)
                    .opacity(0.8)
                    .overlay {
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .padding()
                    }
                
            }
            
            .cornerRadius(8)
            
            Text(title)
                .font(.custom(Font.quicksandMedium, size: 13))
                .foregroundColor(.black)
                .lineLimit(2) // Allow up to 2 lines of text
                .fixedSize(horizontal: false, vertical: true) // Wrap text to fit vertically
        }
    }
}

#Preview {
    HomeServicesCell(image: "my_pic", title: "Grub door mart")
}
