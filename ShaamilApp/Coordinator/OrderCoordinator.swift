//
//  ReportCoordinator.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 16/03/2025.
//

import SwiftUI
import Combine

final class OrderCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    let deepLink = PassthroughSubject<DeepLink, Never>()

    func push(to destination: OrderDestination) {
        path.append(destination)
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func handleDeepLink(_ link: DeepLink) {
        switch link {
        case .orderDetails:
            push(to: .orderDetails)
        default:
            break
        }
    }
}
