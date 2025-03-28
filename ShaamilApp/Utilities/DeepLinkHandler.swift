//
//  DeepLinkHandler.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 18/03/2025.
//

import Foundation
import Combine

enum DeepLink {
    case home
    case settings
    case orderDetails
    case login
}

final class DeepLinkHandler {
    static func parse(url: URL) -> DeepLink? {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard let host = components?.host else { return nil }
        
        switch host {
        case "home":
            return .home
        case "settings":
            return .settings
        case "reports":
            return .orderDetails
        case "login":
            return .login
        default:
            return nil
        }
    }
}
