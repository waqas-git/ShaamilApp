//
//  TextfieldModifier.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 27/03/2025.
//

import SwiftUI

struct TextfieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.09), radius: 6, y: 3) // box-shadow
                .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .stroke(Color.black, lineWidth: 0.3) // border
                )
                .cornerRadius(11) // border-radius
                .opacity(0.72
    }
}
