//
//  HomeViewModel.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var itemCount: Int = 5
    @Published var serviceItems: [ServicesModel] = ServicesModel.mockData
}
