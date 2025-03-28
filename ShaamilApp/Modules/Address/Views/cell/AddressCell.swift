//
//  AddressCell.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 25/03/2025.
//

import SwiftUI

struct AddressCell: View {
    let address: Address
        
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(address.title)
                        .font(.custom(Font.quicksandMedium, size: 15))
                        .foregroundColor(Color.textGray)
                        //.bold()
                    
                    Text(address.details)
                        .font(.custom(Font.quicksandRegular, size: 12))
                        .foregroundColor(Color.textGray)
                        .padding(.top, 2)
                    
                    Text(address.phoneNumber)
                        .font(.custom(Font.quicksandMedium, size: 15))
                        .foregroundColor(.accent)
                        .bold()
                        .padding(.top, 2)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2))
            //.padding(.horizontal)
        }
}

#Preview {
    AddressCell(address: Address(title: "", details: "", phoneNumber: ""))
}
