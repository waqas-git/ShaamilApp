//
//  CountrySheet.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 24/03/2025.
//

import SwiftUI

struct CountrySheet: View {
    @ObservedObject var viewModel = CountryViewModel()
    @Binding var isPresented: Bool
    @State private var selectedCountry: Country?
    
    var body: some View {
        VStack(spacing: 16) {
            // Search Bar
            HStack {
                TextField("Search...", text: $viewModel.searchText)
                    .padding(10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .font(.custom("Avenir", size: 17))
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.orange)
            }
            .padding(.horizontal)
            
            // Country List
            List(viewModel.filteredCountries) { country in
                HStack {
                    Text(country.name)
                        .font(.custom("Avenir", size: 17))
                        .foregroundColor(selectedCountry == country ? Color.accentColor : .black)
                    
                    Spacer()
                    
                    Text(country.code)
                        .font(.custom("Avenir", size: 17))
                        .foregroundColor(selectedCountry == country ? Color.accentColor : .gray)
                }
                .padding(.vertical, 5)
                .onTapGesture {
                    selectedCountry = country
                }
            }
            .listStyle(PlainListStyle())
            
            Spacer()
        }
        .padding(.top)
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.5) // Half screen height
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .transition(.move(edge: .bottom))
        .ignoresSafeArea()
    }
}

#Preview {
    // CountrySheet()
}
