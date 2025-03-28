//
//  RootView.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 17/03/2025.
//

import SwiftUI
struct RootView: View {
    @StateObject private var appCoordinator = AppCoordinator.shared
    @StateObject var authCoordinator = AuthCoordinator()
    @StateObject var homeCoordinator = HomeCoordinator()
    @StateObject var reportCoordinator = OrderCoordinator()
    @State private var selectedTab = 0

    var body: some View {
        if appCoordinator.isLogin {
            TabView(selection: $appCoordinator.selectedTab) {
                NavigationStack(path: $homeCoordinator.path) {
                    HomeScreen()
                        .navigationDestination(for: HomeDestination.self) { destination in
                            switch destination {
                            case .settings:
                                Text("Settings View")
                            case .detail(_):
                                Text("Detail View")
                            }
                        }
                }
                .tabItem { TabBarButton(icon: "home_icon", title: "Home", index: 0, selectedTab: $selectedTab) }
                .tag(AppCoordinator.Tab.home)
                .environmentObject(homeCoordinator)

                NavigationStack(path: $reportCoordinator.path) {
                    OrderScreen()
                        .navigationDestination(for: OrderDestination.self) { destination in
                            switch destination {
                            case .orderDetails:
                                Text("Order Details")
                            }
                        }
                }
                .tabItem { TabBarButton(icon: "order_icon", title: "Orders", index: 0, selectedTab: $selectedTab) }
                .tag(AppCoordinator.Tab.orders)
                .environmentObject(reportCoordinator)
            }
        } else {
            NavigationStack(path: $authCoordinator.path) {
                WellcomeScreen()
                    .navigationDestination(for: AuthDestination.self) { destination in
                        switch destination {
                        case .login:
                            LoginScreen()
                        case .signup:
                            RegisterView()
                        }
                    }
            }
            .environmentObject(authCoordinator)
        }
    }
}
#Preview {
    RootView()
}
