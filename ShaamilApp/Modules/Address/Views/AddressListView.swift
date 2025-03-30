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
            
            HeaderView(title: "Addresses", onBack: {
                dismiss()
            })
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
