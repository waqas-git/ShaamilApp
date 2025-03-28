//
//  TextFieldStyles.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 23/03/2025.
//

import SwiftUI
public enum TextFieldStyles {
    case `default`
    
    var backgroundColor: Color {
        return Color(Color.light_Gray)
    }
    
    var borderColor: Color {
        return .clear
    }
    
    var textColor: Color {
        return Color(Color.dark_gray)
    }
    
    var borderRadius: CGFloat {
        return 30
    }
}
