//
//  ServicesModel.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//

import Foundation
struct ServicesModel: Identifiable, Hashable{
    let id = UUID()
    let icon: String
    let title: String
}

extension ServicesModel{
    public static let mockData: [ServicesModel] = [
        ServicesModel(icon: "food_icon", title: "Food"),
        ServicesModel(icon: "mart_icon", title: "Grub Door Mart"),
        ServicesModel(icon: "box_icon", title: "Grub Door Box")
    ]
}
