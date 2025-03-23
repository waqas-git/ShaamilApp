//
//  CountryViewModel.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 24/03/2025.
//

import SwiftUI
import Combine

// Country Model
struct Country: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let code: String
}

// ViewModel with Search Logic
class CountryViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var filteredCountries: [Country] = []

    private var cancellables = Set<AnyCancellable>()

    // Static list of countries
    private let countries: [Country] = [
        Country(name: "Jordan", code: "+962"),
        Country(name: "Afghanistan", code: "+93"),
        Country(name: "Albania", code: "+355"),
        Country(name: "Andorra", code: "+213"),
        Country(name: "Angola", code: "+93"),
        Country(name: "Antigua and Barbuda", code: "+1268"),
        Country(name: "Argentina", code: "+54"),
        Country(name: "Armenia", code: "+93"),
        Country(name: "Australia", code: "+61"),
        Country(name: "Austria", code: "+93"),
        Country(name: "Azerbaijan", code: "+93"),
        Country(name: "Bahamas", code: "+879")
    ]
    
    init() {
        filteredCountries = countries // Default list

        // Debounced Search
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main) // Optimize user input
            .removeDuplicates()
            .sink { [weak self] text in
                self?.filterCountries(query: text)
            }
            .store(in: &cancellables)
    }
    
    // Filter logic
    private func filterCountries(query: String) {
        if query.isEmpty {
            filteredCountries = countries
        } else {
            filteredCountries = countries.filter {
                $0.name.lowercased().contains(query.lowercased()) ||
                $0.code.contains(query)
            }
        }
    }
}
