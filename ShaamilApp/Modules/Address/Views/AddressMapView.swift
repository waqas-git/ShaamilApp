//
//  AddressMapView.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 26/03/2025.
//

import SwiftUI
import MapKit

struct AddressMapView: View {
    @State private var viewModel = ModifyAddressViewModel()
    @Environment(\.dismiss) var dismiss
       
       var body: some View {
           VStack {
               // Top Bar
               HStack {
                   Button(action: { dismiss() }) {
                       Image(systemName: "arrow.left")
                           .font(.title2)
                           .foregroundColor(.white)
                           .padding()
                           .background(Color.secondaryGreen)
                           .clipShape(Circle())
                   }
                   
                   Spacer()
                   
                   Text("Modify Address")
                       .font(.custom(Font.quicksandRegular, size: 23))
                       .foregroundColor(Color.textGray)
                   
                   Spacer()
                   
                   Button(action: { /* Add search action */ }) {
                       Image("search_icon_gray")
                           .resizable()
                           .frame(width: 40, height: 40)
                           .foregroundColor(.black)
                   }
               }
               .padding(.horizontal)

               // Map View
               Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: [viewModel.currentLocation]) { location in
                   MapMarker(coordinate: location.coordinate, tint: .red)
               }
               .frame(maxHeight: .infinity)
               .cornerRadius(10)
               .padding()
               
               Spacer()
               
               // "Add Full Address" Button
               Button(action: {
                   // Handle adding address
               }) {
                   Text("Add Full Address")
                       .foregroundColor(.white)
                       .padding()
                       .frame(maxWidth: .infinity, maxHeight: 50)
                       .background(Color.accentColor)
                       .clipShape(RoundedRectangle(cornerRadius: 10))
                       .padding(.horizontal)
                       .padding(.top, 10)
               }
               .padding(.bottom, 20)
           }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .onAppear {
               viewModel.requestLocation()
           }
       }
}

#Preview {
    AddressMapView()
}
