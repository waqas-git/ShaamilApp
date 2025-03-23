//
//  CustomTextField.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 22/03/2025.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var phoneNumber: String
    @Binding var selectedCountryCode: String
    @Binding var showCountryPicker: Bool

    var body: some View {
        HStack {
            // Country Flag & Code Dropdown
//            Menu {
//                Button(action: { selectedCountryCode = "+1" }) {
//                    Label("+1 🇺🇸", systemImage: "")
//                }
//                Button(action: { selectedCountryCode = "+44" }) {
//                    Label("+44 🇬🇧", systemImage: "")
//                }
//                Button(action: { selectedCountryCode = "+92" }) {
//                    Label("+92 🇵🇰", systemImage: "")
//                }
//                Button(action: { selectedCountryCode = "+962" }) {
//                    Label("+962 🇯🇴", systemImage: "")
//                }
//            }
           // label{
                HStack {
                    Image("jordanFlag") // Replace with flag images in assets
                        .resizable()
                        .frame(width: 24, height: 16)
                       // .clipShape(RoundedRectangle(cornerRadius: 4))

                    Text(selectedCountryCode)
                        .foregroundColor(.black)

                    Image("downArrow")
                        .resizable()
                        .frame(width: 14, height: 8)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                .padding(.horizontal, 8)
           // }

            Divider()
                .frame(height: 24)
                .background(Color.gray.opacity(0.5))

            // Phone Number Input Field
            TextField("Phone Number", text: $phoneNumber)
                .keyboardType(.numberPad)
                .foregroundColor(.black)

            // Trailing Icon
            Image("cellPhone")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.1)) // Light gray background
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray.opacity(0.3), lineWidth: 1)) // Border
    }
}


#Preview {
    CustomTextField(phoneNumber: .constant(""), selectedCountryCode: .constant(""), showCountryPicker: .constant(false))
}
