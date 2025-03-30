//
//  SettingCell.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//

import SwiftUI

struct SettingCell: View {
    var item: Settings
    var body: some View {
        HStack {
            Image(systemName: item.icon)
                .foregroundColor(.accentColor)
                .frame(width: 20, height: 20)

            Text(item.title)
                .font(.custom(Font.quicksandRegular, size: 18))
                .foregroundColor(.textGray)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.textGray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SettingCell(item: Settings(icon: "person.fill", title: "Points"))
}
