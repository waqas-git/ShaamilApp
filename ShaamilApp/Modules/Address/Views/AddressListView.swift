//
//  AddressListView.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 25/03/2025.
//

import SwiftUI

struct AddressListView: View {
    @State private var viewModel = AddressViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            // Back Button
            ZStack {
                Text("Addresses")
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
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            
            // Title
           
            
            // Add New Address Button
            Button(action: {
                // Handle add new address action
            }) {
                HStack {
                    Image("address_list_icon")
                        .resizable()
                        .frame(width: 20, height: 24)
                    Text("Add New Address")
                        .font(.custom(Font.quicksandMedium, size: 19))
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.secondaryGreen)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                .padding(.top, 10)
            }
            .padding(.top, 8)
            
            // Address List
            List(viewModel.addresses) { address in
                AddressCell(address: address)
                    .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .padding(.top, 15)
        }
    }
}

#Preview {
    AddressListView()
}
