//
//  LoginScreen.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 24/03/2025.
//

import SwiftUI

struct LoginScreen: View {
    @State private var phoneNumber: String = ""
        @State private var isChecked: Bool = false
        @State private var selectedCountryCode: String = "+963"
        
        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    Color.gray.opacity(0.2)
                        .ignoresSafeArea()
                    
                    VStack {
                        Image("app_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                            .padding(.top, 40)
                        
                        Image("main_bg")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                    }
                    
                    VStack {
                        Spacer()
                        
                        ZStack(alignment: .top) {
                            RoundedRectangle(cornerRadius: 0, style: .continuous)
                                .fill(.white)
                                .clipShape(RoundedCorner(radius: geometry.size.width/2, corners: [.topLeft, .topRight]))
                            // .frame(height: 400)
                                .shadow(radius: geometry.size.width/2)
                                .offset(y: 40)
                                .ignoresSafeArea(edges: .bottom)
                            
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Image("grubdoor_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                )
                                .offset(y: -40)
                            
                            VStack(spacing: 16) {
                                Text("Welcome to Grub Door Customer")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                                    .padding(.top, 50)
                                
                                Text("Login in Your Account")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.orange)
                                
                                HStack {
                                    HStack {
                                        Image("flag_syria")
                                            .resizable()
                                            .frame(width: 24, height: 16)
                                        Text("+963")
                                            .foregroundColor(.black)
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.horizontal, 12)
                                    .frame(height: 50)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                    
                                    TextField("Enter Your Phone Number", text: .constant(""))
                                        .padding(.horizontal)
                                        .frame(height: 50)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                }
                                
                                HStack {
                                    Button(action: {}) {
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: 24, height: 24)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 4)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                    }
                                    
                                    Text("I agree to the terms and privacy")
                                        .foregroundColor(.black)
                                }
                                
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "arrow.right.to.line")
                                            .foregroundColor(.white)
                                        Text("LOGIN")
                                            .foregroundColor(.white)
                                    }
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                    .background(
                                        LinearGradient(gradient: Gradient(colors: [Color.green, Color.orange]), startPoint: .leading, endPoint: .trailing)
                                    )
                                    .cornerRadius(10)
                                }
                                
                                HStack {
                                    Text("Don’t Have an Account?")
                                        .foregroundColor(.gray)
                                    Text("Sign Up Now")
                                        .foregroundColor(.green)
                                        .underline()
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    LoginScreen()
}
