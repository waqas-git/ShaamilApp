//
//  DealsScreen.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 05/04/2025.
//

import SwiftUI

struct DealsScreen: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                // Background Header Image
                ZStack {
                    Image("deals_header_bg") // Replace with your image name
                        .resizable()
                        .frame(width: .infinity, height: geometry.size.height * 0.35)
                    
                    VStack(alignment: .center){
                        HeaderView(title: "Deals", foregroundColor: .white){
                            dismiss()
                        }
                        .padding(.horizontal)
                        Text("Wellcome to your Deals")
                            .font(.custom(Font.quicksandRegular, size: 23))
                            .foregroundColor(.white)
                    }
                    .offset(y: -40)
                    
                    VStack{
                        Spacer().frame(height: geometry.size.height * 0.25)
                        Image("deals_logo") // Replace with actual icon
                            .frame(width: 80, height: 80)
                            .shadow(radius: 5)
                    }
                }
                
                //                VStack {
                //                    Spacer().frame(height: 60)
                //
                //                    Text("Welcome to your Deals")
                //                        .font(.headline)
                //                        .foregroundColor(.white)
                //                }
                
                VStack {
                    Spacer().frame(height: geometry.size.height * 0.40) // Leave space for logo
                    
                    // ListView Container
                    List {
                        ForEach(0..<3) { index in
                            DealRowView(
                                title: "Restaurant Name Name",
                                subtitle: "40% Off on all Burgers",
                                offerText: "Available Now",
                                imageName: "deals_sample_img"
                            )
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
                            .padding()
                        }
                    }
                    .listStyle(PlainListStyle())
                    .frame(height: geometry.size.height * 0.65)
                }
                
                // Logo Circle
                
                
                // Title Text on Top
                
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

// MARK: - List Cell View
struct DealRowView: View {
    var title: String
    var subtitle: String
    var offerText: String
    var imageName: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.custom(Font.quicksandMedium, size: 17))
                
                Text(subtitle)
                    .font(.custom(Font.quicksandRegular, size: 13))
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "percent")
                        .foregroundColor(.accent)
                    Text(offerText)
                        .foregroundColor(.accent)
                        .underline()
                        .font(.custom(Font.quicksandMedium, size: 14))
                }
            }
            .padding(.vertical, 12)
            .padding(.leading, 12)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 90)
                .clipShape(RoundedCornersList(rightRadius: 50))
                .clipped()
        }
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white)
                .clipShape(RoundedCorner(radius: 50, corners: [.topRight, .bottomRight]))
        )
        .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 3)
        .opacity(0.92)
    }
}

struct RoundedCornersList: Shape {
    var rightRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topRight, .bottomRight],
            cornerRadii: CGSize(width: rightRadius, height: rightRadius)
        )
        return Path(path.cgPath)
    }
}


#Preview {
    DealsScreen()
}
