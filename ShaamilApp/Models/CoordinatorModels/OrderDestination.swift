//
//  OrderDestination.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 26/03/2025.
//

import Foundation
enum OrderDestination: Hashable, Identifiable {
    case orderDetails
    
    var id: String {
        switch self {
        case .orderDetails:
            return "orderDetails"
        }
    }
}
