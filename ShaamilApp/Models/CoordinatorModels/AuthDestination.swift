//
//  AuthDestination.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 16/03/2025.
//

import Foundation
enum AuthDestination: Hashable, Identifiable{
    case login
    case signup
    
    var id: String {
           switch self {
           case .login:
               return "login"
           case .signup:
               return "signup"
           }
       }
}
