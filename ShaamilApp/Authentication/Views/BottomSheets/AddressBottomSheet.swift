//
//  AddressBottomSheet.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 24/03/2025.
//

import SwiftUI

struct AddressBottomSheet: View {
    @Binding var isPresented: Bool
    @State private var addressName: String = ""
    @State private var longitude: String = ""
    @State private var latitude: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            // Header with Icon and Title
            HStack {
                Image(systemName: "map.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text("Add New Address")
                    .font(.custom("Avenir-black", size: 25))
                    .fontWeight(.heavy)
                    .padding(.leading, 16)
                
                Spacer()
            }
            .padding(.horizontal)
            
            TextField("Address", text: $addressName)
                .textFieldModifier(.default, iconLeft: Image("address_icon"))
                .foregroundColor(.dark_gray)
                .background(Color.light_Gray)
                .cornerRadius(30)
            
            TextField("Latitude", text: $latitude)
                .textFieldModifier(.default, iconLeft: Image("lat_long"))
                .foregroundColor(.dark_gray)
                .background(Color.light_Gray)
                .cornerRadius(30)
            
            TextField("Longitude", text: $longitude)
                .textFieldModifier(.default, iconLeft: Image("lat_long"))
                .foregroundColor(.dark_gray)
                .background(Color.light_Gray)
                .cornerRadius(30)
            
            // Detect Current Location Button
            HStack{
                Button(action: {
                    // Implement location detection logic
                }) {
                    Text("Detect current location")
                        .font(.custom("Avenir", size: 14))
                        .foregroundColor(.orange)
                        .underline()
                        .padding(.leading)
                }
                Spacer()
            }
            
            // Add Address Button
            Button(action: {
                // Handle address saving
            }) {
                Text("Add Address")
                    .font(.custom("Avenir", size: 18))
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(.vertical)
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .ignoresSafeArea()
    }
}

//// Main View to Show Bottom Sheet
//struct ContentView: View {
//    @State private var showBottomSheet = false
//    
//    var body: some View {
//        VStack {
//            Button("Show Bottom Sheet") {
//                showBottomSheet.toggle()
//            }
//            .sheet(isPresented: $showBottomSheet) {
//                AddressBottomSheet(isPresented: $showBottomSheet)
//                    .presentationDetents([.medium, .large]) // iOS 16+ Bottom Sheet Sizes
//            }
//        }
//    }
//}


#Preview {
    AddressBottomSheet(isPresented: .constant(true))
}
