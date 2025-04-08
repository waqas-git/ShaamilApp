//
//  CouponScreen.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 04/04/2025.
//

import SwiftUI

struct CouponScreen: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedOption: String? = nil
    @StateObject var viewModel = CouponViewModel()
    let options = ["Active", "Used", "Expired"]
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "Coupon", onBack: {
                dismiss()
            })
            .frame(maxWidth: .infinity)
                        //.background(Color.white)
                        .padding(.horizontal)
            
            HStack{
                Image("voucher_icon")
                    .resizable()
                    .frame(width: 40, height: 44)
                VStack(alignment: .leading){
                    Text("You have a dicount coupon?")
                        .font(.custom(Font.quicksandMedium, size: 19))
                    Text("Add it and engjoy the savings")
                        .font(.custom(Font.quicksandMedium, size: 13))
                }.padding(.horizontal, 5)
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.secondaryGreen)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
            .padding(.top, 30)
            
            HStack(spacing: 15) {
                ForEach(options, id: \.self) { option in
                    CouponStateButton(title: option, selectedOption: $selectedOption)
                }
            }.padding(.top, 40)
            
            
            List(viewModel.couponItems){items in
                CouponCell(title: items.title, subTitle: items.subtitle)
                    .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .padding(.top, 15)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true) // Hide default back button
        .safeAreaInset(edge: .top) { Color.clear.frame(height: 0) } // Handle the safe area
    }
}

#Preview {
    CouponScreen()
}

