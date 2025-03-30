//
//  AppCoordinator.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 26/03/2025.
//

import SwiftUI
import Combine
final class AppCoordinator: ObservableObject {
    
    static let shared = AppCoordinator()  // Singleton for deep linking
    
    @Published var isLogin = true
    @Published var selectedTab: Tab = .home
    @Published var deepLink: DeepLink?
    
    var cancellables = Set<AnyCancellable>()
    
    enum Tab {
        case home
        case orders
        case settings
        case points
        case wallet
    }
    
    // Separate paths to avoid "let constant" issue
    @Published var homePath = NavigationPath()
    @Published var orderPath = NavigationPath()
    @Published var authPath = NavigationPath()
    @Published var pointsPath = NavigationPath()
    @Published var walletPath = NavigationPath()
    
    let authCoordinator = AuthCoordinator()
    let homeCoordinator = HomeCoordinator()
    let orderCoordinator = OrderCoordinator()
    
    func resetPaths() {
        homePath = NavigationPath()
        orderPath = NavigationPath()
        authPath = NavigationPath()
    }
    
    init() {
        handleDeepLinking()
    }
    
    func handleDeepLinking() {
        $deepLink
            .compactMap { $0 }
            .sink { deepLink in
                switch deepLink {
                case .home:
                    self.selectedTab = .home
                case .settings:
                    self.selectedTab = .settings
                case .orderDetails:
                    self.selectedTab = .orders
                    self.orderCoordinator.push(to: .orderDetails)
                case .login:
                    self.isLogin = false
                    self.authCoordinator.push(to: .login)
                case .wallet:
                    self.selectedTab = .wallet
                case .points:
                    self.selectedTab = .points
                }
            }
            .store(in: &cancellables)
    }
    
    func openURL(_ url: URL) {
        if let deepLink = DeepLinkHandler.parse(url: url) {
            self.deepLink = deepLink
        }
    }
}


enum Destination: Hashable, Identifiable {
    case home
    case auth
    
    var id: String {
        switch self {
        case .home: return "home"
        case .auth: return "auth"
        }
    }
}

struct Item: Hashable {
    let id = UUID()
    let name: String
}
