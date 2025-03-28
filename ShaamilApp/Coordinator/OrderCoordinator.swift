//
//  ReportCoordinator.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 16/03/2025.
//

import SwiftUI
//final class ReportCoordinator: Coordinator {
//    @Published var path = NavigationPath()
//    @Published var presentedDestination: Destination?
//    typealias Destination = ReportDestination
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

final class ReportCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    let deepLink = PassthroughSubject<DeepLink, Never>()

    func push(to destination: ReportDestination) {
        path.append(destination)
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func handleDeepLink(_ link: DeepLink) {
        switch link {
        case .reportDetails:
            push(to: .reportDetails)
        default:
            break
        }
    }
}
