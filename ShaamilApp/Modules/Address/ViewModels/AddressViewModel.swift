//
//  AddressViewModel.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 25/03/2025.
//
import SwiftUI

@Observable
class AddressViewModel{
    var addresses: [Address] = [
           Address(title: "Damascus - Abu Rummaneh",
                   details: "Damascus - Abu Rummaneh / Khaled Bin Al-Walid Street - mashrue dumir, first floor",
                   phoneNumber: "+963 789547584"),
           Address(title: "Damascus - Abu Rummaneh",
                   details: "Damascus - Abu Rummaneh / Khaled Bin Al-Walid Street - mashrue dumir, first floor",
                   phoneNumber: "+963 789547584")
       ]
}
