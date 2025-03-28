//
//  ReportDestination.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 16/03/2025.
//

import Foundation
enum ReportDestination: Hashable, Identifiable {
    case reportDetails
    
    var id: String {
        switch self {
        case .reportDetails:
            return "reportDetails"
        }
    }
}
