//
//  Coupons.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 04/04/2025.
//

import Foundation
struct Coupons: Codable, Identifiable {
    var id = UUID()
    let title: String
    let subtitle: String
}

