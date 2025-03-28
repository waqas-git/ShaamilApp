//
//  HomeCoordinator.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 16/03/2025.
//

import Foundation
import SwiftUI
//final class HomeCoordinator: Coordinator {
//    @Published var path = NavigationPath()
//    @Published var presentedDestination: Destination?
//    typealias Destination = HomeDestination
//    
//    func push(to destination: Destination) {
//        path.append(destination)
//    }
//    
//    func present(_ destination: Destination) {
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

import Combine

final class HomeCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    let deepLink = PassthroughSubject<DeepLink, Never>()

    func push(to destination: HomeDestination) {
        path.append(destination)
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func handleDeepLink(_ link: DeepLink) {
        switch link {
        case .settings:
            push(to: .settings)
        default:
            break
        }
    }
}
