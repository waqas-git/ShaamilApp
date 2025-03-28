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
                  let height = geometry.size.height * 0.65
                  
                  ZStack {
                      Color.gray.opacity(0.2)
                          .ignoresSafeArea()
                      
                      // Top View (Main Background & Logo)
                      VStack {
                          Spacer()
                          Image("app_logo")
                              .resizable()
                              .scaledToFit()
                              .frame(width: 130)
                              .padding(.trailing, 40)
                             // .padding(.top, 44)
                          
                          Image("main_bg")
                              .resizable()
                              .scaledToFit()
                              .frame(height: 320)
                          Spacer()
                      }
                      .padding()
                      .frame(height: height)
                      .offset(y: -height * 0.35)
                      //.background(Color.clear) // Ensures transparency

                      // Bottom View (Login Section)
                      VStack {
                          
                          ZStack(alignment: .top) {
                              // White Rounded Background
                              RoundedRectangle(cornerRadius: 0, style: .continuous)
                                  .fill(Color.white)
                                  .clipShape(RoundedCorner(radius: geometry.size.width / 2, corners: [.topLeft, .topRight]))
                                  .shadow(radius: 10)
                                  .ignoresSafeArea(edges: .bottom)
                              
                              // Overlapping Circular Logo
                              Circle()
                                  .fill(Color.clear)
                                  .frame(width: 80, height: 80)
                                  .overlay(
                                      Image("login_icon")
                                          .resizable()
                                          .scaledToFit()
                                          .frame(width: 100, height: 100)
                                  )
                                  .offset(y: -40) // Moves the circle up
                              
                              // Login Fields
                              VStack(spacing: 16) {
                                  Text("Welcome to Grub Door\n Customer")
                                      .font(.system(size: 20, weight: .bold))
                                      .foregroundColor(.black)
                                      .multilineTextAlignment(.center)
                                      .padding(.top, 80)
                                  
                                  HStack{
                                      Text("Login in Your Account")
                                          .font(.system(size: 20, weight: .medium))
                                          .foregroundColor(.accentColor)
                                          .padding(.top, 20)
                                      Spacer()
                                  }
                                  
                                  HStack {
                                      // Country Code Selection
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
                                      
                                      // Phone Number Field
                                      TextField("Enter Your Phone Number", text: .constant(""))
                                          .padding(.horizontal)
                                          .frame(height: 50)
                                          .background(Color.gray.opacity(0.2))
                                          .cornerRadius(10)
                                  }
                                  
                                  // Terms Checkbox
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
                                      Spacer()
                                  }
                                  
                                  Spacer()
                                  // Login Button
                                  Button(action: {}) {
                                      HStack {
                                          Image(systemName: "arrow.right.to.line")
                                              .foregroundColor(.white)
                                          Text("LOGIN")
                                              .foregroundColor(.white)
                                      }
                                      .frame(maxWidth: .infinity, minHeight: 50)
                                      .background(
                                        Color.gradientBg
                                      )
                                      .cornerRadius(10)
                                  }
                                  
                                  // Signup Link
                                  HStack {
                                      Text("Don’t Have an Account?")
                                          .foregroundColor(.gray)
                                      Text("Sign Up Now")
                                          .foregroundColor(.green)
                                          .underline()
                                  }
                                  Spacer()
                              }
                              .padding(.horizontal, 25)
                              .padding()
                          }
                          .frame(height: height)
                          .offset(y: height - height * 0.70) // Moves the bottom view up to overlap the top
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
