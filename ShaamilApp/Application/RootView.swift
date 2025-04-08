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
    @StateObject var orderCoordinator = OrderCoordinator()
    @StateObject var pointsCoordinator = PointsCoordinator()
    @StateObject var walletCoordinator = WalletCoordinator()
    @StateObject var settingsCoordinator = SettingsCoordinator()
    @State private var selectedTab = 0

    var body: some View {
        if appCoordinator.isLogin {
            TabView(selection: $appCoordinator.selectedTab) {
                // MARK: -Home Navigation
                NavigationStack(path: $homeCoordinator.path) {
                    HomeScreen()
                        .navigationDestination(for: HomeDestination.self) { destination in
                            switch destination {
                            case .coupon:
                                CouponScreen()
                            case .detail(_):
                                Text("Detail View")
                            case .deals:
                                Text("Deals View")
                            }
                        }
                }
                .tabItem {
                    Image(systemName: "house.fill")
                        .resizable()
                        .renderingMode(.template)
                    Text("Home")
                    }
                .tag(AppCoordinator.Tab.home)
                .environmentObject(homeCoordinator)

                // MARK: -Order Navigation
                NavigationStack(path: $orderCoordinator.path) {
                    OrderScreen()
                        .navigationDestination(for: OrderDestination.self) { destination in
                            switch destination {
                            case .orderDetails:
                                Text("Order Details")
                            }
                        }
                }
                .tabItem { /*TabBarButton(icon: "order_icon", title: "Orders", index: 0, selectedTab: $selectedTab)*/
                    Image(systemName: "archivebox.fill")
                        .resizable()
                        .renderingMode(.template)
                    Text("Orders")}
                .tag(AppCoordinator.Tab.orders)
                .environmentObject(orderCoordinator)
                
                // MARK:  -Points Navigation
                NavigationStack(path: $pointsCoordinator.path) {
                    PointsScreen()
                        .navigationDestination(for: PointsDestination.self) { destination in
                            switch destination {
                            case .coupon:
                                Text("coupons")
                            case .deals:
                                Text("Deals")
                            }
                        }
                }
                .tabItem { TabBarButton(icon: "points_icon", title: "", index: 0, selectedTab: $selectedTab) }
                .tag(AppCoordinator.Tab.points)
                .environmentObject(pointsCoordinator)
                
                // MARK:  -Wallet Navigation
                NavigationStack(path: $walletCoordinator.path) {
                    PointsScreen()
                        .navigationDestination(for: WalletDestination.self) { destination in
                            switch destination {
                            case .paymentMethod:
                                Text("Payment Method")
                            }
                        }
                }
                .tabItem { /*TabBarButton(icon: "wallet_icon", title: "Wallet", index: 0, selectedTab: $selectedTab)*/
                    Image(systemName: "wallet.bifold.fill")
                        .resizable()
                        .renderingMode(.template)
                    Text("Settings")}
                .tag(AppCoordinator.Tab.wallet)
                .environmentObject(walletCoordinator)
                
                // MARK:  -Settings Navigation
                NavigationStack(path: $walletCoordinator.path) {
                    SettingsScreen()
                        .navigationDestination(for: SettingsDestination.self) { destination in
                            switch destination {
                            case .details(_):
                                Text("Details")
                            }
                        }
                }
                .tabItem { /*TabBarButton(icon: "settings_icon", title: "Settings", index: 0, selectedTab: $selectedTab)*/
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .renderingMode(.template)
                    Text("Settings")}
                .tag(AppCoordinator.Tab.settings)
                .environmentObject(settingsCoordinator)
                
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
