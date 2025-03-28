//
//  Coordinator.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 17/03/2025.
//
import SwiftUI
protocol Coordinator: ObservableObject{
    associatedtype Destination: Hashable
        func push(to destination: Destination)
        func pop()
        func present(_ destination: Destination)
        func dismiss()
    
    var path: NavigationPath { get set }
    var presentedDestination: Destination? { get set }
   // var popupDestination: Destination? { get set }  // For popups
    
//    func showPopup(_ destination: Destination)
//    func hidePopup()
}
