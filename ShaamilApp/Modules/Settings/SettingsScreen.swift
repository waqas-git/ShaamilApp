//
//  SettingsScreen.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//

import SwiftUI

struct SettingsScreen: View {
    @StateObject var viewModel = SettingsViewModel()
    var body: some View {
        VStack {
             /// Header
             HeaderView(title: "Settings", onBack: {})

             /// Logo Image
             Image("settings_main_icon")
                 .resizable()
                 .scaledToFit()
                 .frame(width: 75, height: 75)
                 .padding(.top, 20)

             /// List (No Background)
            List(viewModel.settingListItems) { item in
                SettingCell(item: item)
             }
             .listStyle(.plain) // Removes background and separators
             .scrollIndicators(.hidden)
             .frame(maxHeight: .infinity) // Takes remaining space

             /// Bottom Button (Logout)
             Button(action: {
                 print("Logout")
             }) {
                 Text("Logout")
                     .foregroundColor(.white)
                     .frame(maxWidth: .infinity, minHeight: 50)
                     .background(Color.gradientBg)
                     .cornerRadius(10)
             }
             .padding(.bottom, 20)
             .padding(.horizontal, 20)
         }
         .frame(maxWidth: .infinity, maxHeight: .infinity)
         .padding(.horizontal, 20)
    }
}

#Preview {
    SettingsScreen()
}
