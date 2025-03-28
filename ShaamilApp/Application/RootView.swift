//
//  RootView.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 17/03/2025.
//

import SwiftUI

//struct RootView: View {
//   // @StateObject var appCoordinator = AppCoordinator()
//    @StateObject var authCoordinator = AuthCoordinator()
//    @StateObject var homeCoordinator = HomeCoordinator()
//    @StateObject var reportCoordinator = ReportCoordinator()
//    @State var islogin:Bool = false
//    var body: some View {
//        //        NavigationStack(path: $appCoordinator.authCoordinator.path) {
//        // ✅ Move NavigationStack here
//        if islogin {
//            TabView {
//                NavigationStack(path: $homeCoordinator.path) {
//                    HomeScreen()
//                        .navigationDestination(for: HomeDestination.self) { destination in
//                            switch destination {
//                            case .settings: SettingsView()
//                            case .detail(_):
//                                EmptyView()
//                            }
//                        }
//                }
//                .tabItem { Label("Home", systemImage: "house") }
//                .environmentObject(homeCoordinator)
//                //.tag(AppCoordinator.Tab.home)
//                
//                NavigationStack(path: $reportCoordinator.path) {
//                    ReportView()
//                        .navigationDestination(for: ReportDestination.self) { destination in
//                            switch destination {
//                            case .reportDetails: ReportDetailsView()
//                            }
//                        }
//                }
//                .tabItem { Label("Reports", systemImage: "doc.text") }
//                .environmentObject(reportCoordinator)
//                //.tag(AppCoordinator.Tab.profile)
//            }
//            
//        } else {
//            NavigationStack(path: $authCoordinator.path) {
//                IntroScreen()
//                    .navigationDestination(for: AuthDestination.self) { destination in
//                        switch destination {
//                        case .login:
//                            LoginScreen()
//                        case .signup:
//                            SignUpScreen()
//                        }
//                    }
//            }
//            .environmentObject(authCoordinator)  // ✅ This should NOT have another NavigationStack
//        }
//    }
//}
struct RootView: View {
    @StateObject private var appCoordinator = AppCoordinator.shared
    @StateObject var authCoordinator = AuthCoordinator()
    @StateObject var homeCoordinator = HomeCoordinator()
    @StateObject var reportCoordinator = ReportCoordinator()

    var body: some View {
        if appCoordinator.isLogin {
            TabView(selection: $appCoordinator.selectedTab) {
                NavigationStack(path: $homeCoordinator.path) {
                    HomeScreen()
                        .navigationDestination(for: HomeDestination.self) { destination in
                            switch destination {
                            case .settings:
                                SettingsView()
                            case .detail(_):
                                EmptyView()
                            }
                        }
                }
                .tabItem { Label("Home", systemImage: "house") }
                .tag(AppCoordinator.Tab.home)
                .environmentObject(homeCoordinator)

                NavigationStack(path: $reportCoordinator.path) {
                    ReportView()
                        .navigationDestination(for: ReportDestination.self) { destination in
                            switch destination {
                            case .reportDetails:
                                ReportDetailsView()
                            }
                        }
                }
                .tabItem { Label("Reports", systemImage: "doc.text") }
                .tag(AppCoordinator.Tab.reports)
                .environmentObject(reportCoordinator)
            }
        } else {
            NavigationStack(path: $authCoordinator.path) {
                IntroScreen()
                    .navigationDestination(for: AuthDestination.self) { destination in
                        switch destination {
                        case .login:
                            LoginScreen()
                        case .signup:
                            SignUpScreen()
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
