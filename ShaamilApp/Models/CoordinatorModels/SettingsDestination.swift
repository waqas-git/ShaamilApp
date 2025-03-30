//
//  SettingsDestination.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//

import Foundation
enum SettingsDestination: Hashable, Identifiable{
    case details(Int)
    
    var id: String{
        switch self{
        case .details(let item):
            return "details\(item)"
        }
    }
}
