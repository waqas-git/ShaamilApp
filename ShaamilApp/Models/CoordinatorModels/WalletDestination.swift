//
//  CouponDestination.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//

import Foundation
enum WalletDestination: Hashable, Identifiable{
    case paymentMethod
    
    var id: String{
        switch self{
        case .paymentMethod:
            return "paymentMethod"
        }
    }
}
