//
//  ModifyAddressview.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 28/03/2025.
//

import SwiftUI

struct ModifyAddressview: View {
    @State private var buildingName: String = ""
    @State private var apartmentNo: String = ""
    @State private var floor: String = ""
    @State private var streetName: String = ""
    @State private var phoneNumber: String = ""
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        VStack(alignment: .leading) {
            // Back Button
            ZStack {
                Text("Modify Address")
                    .font(.custom(Font.quicksandRegular, size: 23))
                    .foregroundColor(Color.textGray)
                    //.padding(.top, 8)

                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.secondaryGreen)
                            .clipShape(Circle())
                    }
                    .frame(width: 40, height: 40)
                    
                    Spacer()
                }
            }
            
            HStack{
                Spacer()
                Button(action: {
                    // Handle edit site
                }) {
                    Text("Delete Address")
                        .font(.custom(Font.quicksandMedium, size: 14))
                        .underline(true, color: .accent)
                        .foregroundColor(.accent)
                }.padding(.horizontal)
            }.padding(.top, 10)
            
            // Map View (Placeholder for now)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 150)
                .overlay(
                    Image(systemName: "mappin.and.ellipse")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.brown)
                )
               
            
            // Address Details
            ZStack {
                CustomAddressesTextfield(title: "Damascus", placeholder: "Enter Site Address", isMandatory: false, text: $streetName)
                HStack{
                    Spacer()
                    Button(action: {
                        // Handle edit site
                    }) {
                        Text("Edit Site")
                            .font(.custom(Font.quicksandMedium, size: 14))
                            .underline(true, color: .accent)
                            .foregroundColor(.accent)
                    }.padding(.horizontal)
                }
            }
            .addressFieldStyles()
            
            // Address Type Selection
            HStack {
                AddressTypeButton(title: "Apartment")
                AddressTypeButton(title: "Office")
                AddressTypeButton(title: "Building")
            }
            .padding(.top, 30)
            
            // Input Fields
            CustomAddressesTextfield(title: "Building Name", placeholder: "Enter Building Name", isMandatory: true, text: $buildingName)
            HStack{
                CustomAddressesTextfield(title: "Apartment No", placeholder: "Enter Apartment Number", isMandatory: true, text: $apartmentNo)
                
                CustomAddressesTextfield(title: "Floor", placeholder: "Enter Floor", isMandatory: true, text: $floor)
            }
            CustomAddressesTextfield(title: "Street Name", placeholder: "Enter Street Name", isMandatory: true, text: $streetName)
            
            // Phone Number Input
            HStack {
                Text("+963")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5)))
                TextField("963 789547584", text: $phoneNumber)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5)))
            }
            
            HStack{ // Save Address Button
                Spacer()
                Button(action: {
                    // Handle save action
                }) {
                    Text("Save Address")
                        .font(.custom(Font.quicksandMedium, size: 16))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(
                            Color.gradientBg
                        )
                        .cornerRadius(8)
                }
                .padding(.top, 30)
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

// Address Type Button
struct AddressTypeButton: View {
    var title: String
    @State private var isSelected = false
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            Text(title)
                .font(.custom(Font.quicksandMedium, size: 14))
                .padding()
                .frame(minWidth: 70, minHeight: 30)
                .foregroundColor(.textGray)
                .background(isSelected ? Color.grayBg.opacity(0.2) : Color.grayBg.opacity(0.1))
                .cornerRadius(8)
                .overlay( RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color.textGray : Color.textGray.opacity(0.5)))
        }
    }
}

#Preview {
    ModifyAddressview()
}
