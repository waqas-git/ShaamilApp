//
//  SettingsCoordinator.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//
import SwiftUI
import Combine
final class SettingsCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    let deepLink = PassthroughSubject<DeepLink, Never>()

    func push(to destination: SettingsDestination) {
        path.append(destination)
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
