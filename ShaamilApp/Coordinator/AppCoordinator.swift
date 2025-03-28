//
//  AppCoordinator.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 16/03/2025.
//

import SwiftUI
import Combine
final class AppCoordinator: ObservableObject {
//
//    @Published var isLoggedIn: Bool = true
//    @Published var isLoading: Bool = false
//    //@Published var selectedTab: Tab = .home
//    @Published var authCoordinator = AuthCoordinator()
//    @Published var homeCoordinator = HomeCoordinator()
//    @Published var reportCoordinator = ReportCoordinator()
//    @Published var path = NavigationPath()
//    @Published var presentedDestination: Destination?
//    
//    
//    func push(to destination: Destination) {
//           path.append(destination)
//       }
//
//       func pop() {
//           if !path.isEmpty {
//               path.removeLast()
//           }
//       }
//
//       func present(_ destination: Destination) {
//           presentedDestination = destination
//       }
//
//       func dismiss() {
//           presentedDestination = nil
//       }
    
    static let shared = AppCoordinator()  // Singleton for deep linking

       @Published var isLogin = true
       @Published var selectedTab: Tab = .home
       @Published var deepLink: DeepLink?
       
       var cancellables = Set<AnyCancellable>()

       enum Tab {
           case home
           case reports
       }
    
    // Separate paths to avoid "let constant" issue
       @Published var homePath = NavigationPath()
       @Published var reportPath = NavigationPath()
       @Published var authPath = NavigationPath()

       let authCoordinator = AuthCoordinator()
       let homeCoordinator = HomeCoordinator()
       let reportCoordinator = ReportCoordinator()

       func resetPaths() {
           homePath = NavigationPath()
           reportPath = NavigationPath()
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
                       self.selectedTab = .home
                       self.homeCoordinator.push(to: .settings)
                   case .reportDetails:
                       self.selectedTab = .reports
                       self.reportCoordinator.push(to: .reportDetails)
                   case .login:
                       self.isLogin = false
                       self.authCoordinator.push(to: .login)
                   }
               }
               .store(in: &cancellables)
       }

       func openURL(_ url: URL) {
           if let deepLink = DeepLinkHandler.parse(url: url) {
               self.deepLink = deepLink
           }
       }
    
    
    
//    enum Tab {
//        case home, discover, profile
//    }
//    
//    func checkIsLoggedIn() {
//        //After that we need to implement using user-defaults
//        isLoggedIn = true
//    }
//    
//    func handleDeeplinks(_ deepLinks: String) {
//        switch deepLinks {
//        case "home":
//            selectedTab = .home
//        case "settings":
//            selectedTab = .home
//            homeCoordinator.push(.settings)
//        case "report":
//            selectedTab = .discover
//            reportCoordinator.push(.reportDetails)
//        default:
//            break
//        }
//    }
    
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
