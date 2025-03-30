//
//  HomeDestination.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 16/03/2025.
//

import Foundation
enum HomeDestination: Hashable, Identifiable{
    case detail(Int)
    case deals
    case coupon
    
    var id: String {
        switch self {
        case .detail(let item):
            return "detail-\(item)"
        case .deals:
            return "deals"
        case .coupon:
            return "coupon"
        }
    }
}
