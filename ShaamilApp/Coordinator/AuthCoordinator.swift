//
//  AuthCoordinator.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 16/03/2025.
//

import Foundation
import SwiftUI
import Combine
//class AuthCoordinator: Coordinator {
//    @Published var path = NavigationPath()
//    @Published var presentedDestination: Destination?
//    typealias Destination = AuthDestination
//    func push(to destination: AuthDestination) {
//        path.append(destination)
//    }
//    
//    func present(_ destination: AuthDestination) {
//        presentedDestination = destination
//    }
//        
//    func pop() {
//        path.removeLast()
//    }
//    
//    func dismiss() {
//        presentedDestination = nil
//    }
//}

final class AuthCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    let deepLink = PassthroughSubject<DeepLink, Never>()
    
    func push(to destination: AuthDestination) {
        path.append(destination)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func handleDeepLink(_ link: DeepLink) {
        switch link {
        case .login:
            push(to: .login)
            
        default:
            break
        }
    }
}
