//
//  RegisterView.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 23/03/2025.
//

import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var dateOfBirth: String = ""
    @State private var gender: String = ""
    @State private var address: String = ""
    @State private var showGenderPicker: Bool = false
    let genders = ["Male", "Female"]
    @State var showAddressSheet: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 30){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(Color.primaryColor)
            
            Text("Register as customer")
                .font(.headline)
                .fontWeight(.bold)
            
            VStack(spacing: 12){
                TextField("Username", text: $username)
                    .textFieldModifier(.default, iconLeft: Image("person_icon"))
                    .foregroundColor(.dark_gray)
                    .background(Color.light_Gray)
                    .cornerRadius(30)
                
                TextField("Email", text: $email)
                    .textFieldModifier(.default, iconLeft: Image("mail_icon"))
                    .foregroundColor(.dark_gray)
                    .background(Color.light_Gray)
                    .cornerRadius(30)
                
                TextField("Date of Birth", text: $dateOfBirth)
                    .textFieldModifier(.default, iconLeft: Image("calender_icon"))
                    .foregroundColor(.dark_gray)
                    .background(Color.light_Gray)
                    .cornerRadius(30)
                if !showGenderPicker {
                    TextField("Gender", text: $gender)
                        .textFieldModifier(.default, iconLeft: Image("gender_icon"), iconRight: Image("downArrow"))
                        .foregroundColor(.gray)
                        .background(Color.light_Gray)
                        .cornerRadius(30)
                        .onTapGesture {
                            withAnimation {
                                showGenderPicker.toggle()
                            }
                        }
                } else {
                    Button(action: {
                        withAnimation {
                            showGenderPicker.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "person.2.fill")
                            Text(gender.isEmpty ? "Gender" : gender)
                            Spacer()
                            Image(systemName: "chevron.down")
                        }
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    
                    VStack {
                        ForEach(genders, id: \.self) { genderOption in
                            Text(genderOption)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(UIColor.systemGray5))
                                .onTapGesture {
                                    withAnimation {
                                        gender = genderOption
                                        showGenderPicker = false
                                    }
                                }
                        }
                    }
                    .transition(.move(edge: .top).combined(with: .opacity)) // Smooth transition effect
                }
                
                TextField("Address", text: $address)
                    .textFieldModifier(.default, iconLeft: Image("address_icon"))
                    .foregroundColor(.dark_gray)
                    .background(Color.light_Gray)
                    .cornerRadius(30)
                
                Button(action: {
                    // Handle location detection
                    showAddressSheet = true
                }) {
                    Text("Detect current location")
                        .foregroundColor(.primaryColor)
                        .underline()
                }
                
            }
            
            Button(action: {
               
            }) {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.primaryColor)
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            .padding(.top, 10)
            
        }
        //.background(Color.black)
        .padding(.horizontal, 25)
        .ignoresSafeArea()
        .sheet(isPresented: $showAddressSheet) {
            AddressBottomSheet(isPresented: $showAddressSheet)
                .presentationDetents([.medium, .large]) // iOS 16+ Bottom Sheet Sizes
        }

    }
}

#Preview {
    RegisterView()
}
