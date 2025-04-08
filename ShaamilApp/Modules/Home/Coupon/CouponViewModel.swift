//
//  CouponViewModel.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 04/04/2025.
//
import SwiftUI
class CouponViewModel: ObservableObject {
    @Published var couponItems: [Coupons] = [
        Coupons(title: "One-off Coupon", subtitle: "You have a 20% discount"),
        Coupons(title: "Food Voucher", subtitle: "You have a 20% discount"),
        Coupons(title: "One-off Coupon", subtitle: "You have a 20% discount"),
        Coupons(title: "Food Voucher", subtitle: "You have a 20% discount")
    ]
}
