//
//  SettingsViewModel.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 30/03/2025.
//

import SwiftUI
class SettingsViewModel: ObservableObject{
    @Published var settingListItems: [Settings] = [
        Settings(icon: "person.fill", title: "Account Information"),
        Settings(icon: "book.fill", title: "Voucher"),
        Settings(icon: "gearshape.fill", title: "Points"),
        Settings(icon: "bell.fill", title: "Deals"),
        Settings(icon: "info.circle.fill", title: "My Wallet"),
        Settings(icon: "bell.fill", title: "Notification"),
        Settings(icon: "gearshape.fill", title: "Terms & Conditions"),
        Settings(icon: "bell.fill", title: "Privacy Policy"),
        Settings(icon: "info.circle.fill", title: "Language"),
        Settings(icon: "bell.fill", title: "About Us"),
        Settings(icon: "info.circle.fill", title: "Contact Us"),
        Settings(icon: "book.fill", title: "Voucher"),
        Settings(icon: "gearshape.fill", title: "Points"),
        Settings(icon: "bell.fill", title: "Deals"),
        Settings(icon: "info.circle.fill", title: "My Wallet"),
        Settings(icon: "bell.fill", title: "Notification"),
        Settings(icon: "gearshape.fill", title: "Terms & Conditions"),
        Settings(icon: "bell.fill", title: "Privacy Policy"),
        Settings(icon: "info.circle.fill", title: "Language"),
        Settings(icon: "bell.fill", title: "About Us"),
        Settings(icon: "info.circle.fill", title: "Contact Us")
        
        ]
    
}
