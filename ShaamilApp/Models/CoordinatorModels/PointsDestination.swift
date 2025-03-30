//
//  PointsDestination.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//
import Foundation
enum PointsDestination: Hashable, Identifiable  {
    case deals
    case coupon
    var id: String {
        switch self {
        case .deals:
            return "deals"
        case .coupon:
            return "coupon"
        }
    }
}
