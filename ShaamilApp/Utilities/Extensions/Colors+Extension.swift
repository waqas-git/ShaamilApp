//
//  Colors+Extension.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 23/03/2025.
//

import SwiftUI

extension Color{
    static let accentColor = Color("AccentColor")
    static let light_Gray = Color("light_gray")
    static let dark_gray = Color("dark_gray")
    static let grayImageColor = Color("grayImageColor")
    static let gradientBg = LinearGradient(gradient: Gradient(colors: [Color(hex: "#F16622"), Color(hex: "#1B7971")]),
                             startPoint: .leading,
                             endPoint: .trailing)
}


//public struct Colors {
//     static let gradientBg = LinearGradient(gradient: Gradient(colors: [Color(hex: "#F16622"), Color(hex: "#1B7971")]),
//                              startPoint: .leading,
//                              endPoint: .trailing)
//}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: .whitespacesAndNewlines))
        scanner.currentIndex = hex.hasPrefix("#") ? hex.index(after: hex.startIndex) : hex.startIndex
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
