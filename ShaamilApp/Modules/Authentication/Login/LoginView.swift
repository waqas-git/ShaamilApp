//
//  LoginView.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 20/03/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var phoneNumber: String = ""
    @State private var selectedCountryCode: String = "+962" // Default country code
    @State private var showCountryPicker = false
    @State var showPhoneCodeSheet: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: -20) { // Set spacing to 0 to remove gaps
                // Top Image
                ZStack{
                    Image("topImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: 300)
                        .clipped()
                    VStack{
                        HStack{
                            Button(action: {
                                print("Button tapped!")
                            }) {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(Color.accentColor)
                                    .font(.title2)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 100)
                        // Spacer()
                    }
                }
                
                // White Background
                ZStack(alignment: .top){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .ignoresSafeArea(edges: .bottom)
                    
                    VStack(alignment: .center){
                        // Floating logo
                        ZStack{
                            Image("group_container")
                                .resizable()
                                .frame(width: 300, height: 135)
                            
                            Image("group")
                                .resizable()
                                .frame(width: 100, height: 55)
                                .background(Color.white)
                            
                        }.offset(y: -60) // Floating effect
                        
                        Text("Welcome to Alshaamil Customer")
                            .font(.system(size: 20, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .padding(.top, 0)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text("Login/ Register")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.leading)
                            
                            CustomTextField(phoneNumber: $phoneNumber, selectedCountryCode: $selectedCountryCode, showCountryPicker: $showCountryPicker)
                                .onTapGesture {
                                    showPhoneCodeSheet = true
                                }
                            
                            HStack(alignment: .top) {
                                CheckBoxView()
                                Text("I have read and agree to Alshaamil Terms and Privacy")
                                    .font(.system(size: 14))
                                    .lineLimit(nil) // Allows unlimited lines
                                    .fixedSize(horizontal: false, vertical: true) // Ensures text wraps properly
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.top, 5)
                            .padding(.leading)
                            
                            Spacer()
                            
                            Button(action: {
                                // Handle login action
                            }) {
                                HStack {
                                    Image("loginBtnImg")
                                        .resizable()
                                        .frame(width: 17, height: 20)
                                    Text("Login")
                                }
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 50)
                    }
                    
                }
            }
            .ignoresSafeArea(.all)
            .background(Color.white)
            //            .sheet(isPresented: $showPhoneCodeSheet) {
            //                CountrySheet(isPresented: $showPhoneCodeSheet)
            //            }
            if(showPhoneCodeSheet){
                VStack {
                    Spacer()
                    CountrySheet(isPresented: $showPhoneCodeSheet)
                        .transition(.move(edge: .bottom))
                        .animation(.spring())
                }
                .background(
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showPhoneCodeSheet = false
                        }
                )
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        
    }
}

struct CheckBoxView: View {
    @State private var isChecked: Bool = false
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .foregroundColor(isChecked ? Color.accentColor : Color.accentColor)
        }
    }
}

#Preview {
    LoginView()
}

