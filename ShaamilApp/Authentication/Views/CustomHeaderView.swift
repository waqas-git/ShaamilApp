//
//  CustomHeaderView.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 21/03/2025.
//

import SwiftUI
struct CustomHeaderView: View {
    let onBack: () -> Void
    
    var body: some View {
        ZStack {
            Color.purple
            Image("topImage")
                .resizable()
                .ignoresSafeArea(edges: .top)
                .frame(height: 450)
                //.resizable()
                .frame(maxWidth: .infinity, maxHeight: 300)
                .clipped()
            
            VStack{
                HStack{
                    Button(action: onBack) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.orange)
                            .font(.title2)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 60)
            .padding(.horizontal, 15)
        }.ignoresSafeArea(edges: .top)
    }
}

#Preview {
    CustomHeaderView() {
        
    }
}
