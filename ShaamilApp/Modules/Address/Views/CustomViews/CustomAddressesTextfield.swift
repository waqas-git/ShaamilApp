//
//  CustomAddressesTextfield.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 26/03/2025.
//

import SwiftUI

struct CustomAddressesTextfield: View {
    var title: String
    var placeholder: String
    var isMandatory: Bool
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack{
                Text(title)
                    .font(.custom(Font.quicksandMedium, size: 15))
                    .foregroundColor(Color.textGray)
                    .padding()
                    .padding(.top, 6)
                if isMandatory{
                    Text("*")
                        .font(.custom(Font.quicksandMedium, size: 25))
                        .foregroundColor(Color.redText)
                        .padding(.top, 10)
                }
            }.frame(height: 25)

            TextField(placeholder, text: $text)
                .font(.custom(Font.quicksandRegular, size: 12))
                .foregroundColor(Color.textGray)
                .background(Color.clear)
                .frame(height: 20)
                .padding(.horizontal)
        }
        .addressFieldStyles()
    }
}

#Preview {
    @Previewable @State var text = ""
    CustomAddressesTextfield(title: "Building Name", placeholder: "House no.", isMandatory: true,text: $text)
    CustomAddressesTextfield(title: "Building Name", placeholder: "House no.", isMandatory: false,text: $text)
}
