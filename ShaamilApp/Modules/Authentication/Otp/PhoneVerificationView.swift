//
//  PhoneVerificationView.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 24/03/2025.
//

import SwiftUI

struct PhoneVerificationView: View {
    @State private var otp: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedIndex: Int?
    @State private var timeRemaining = 180 // 2:45 in seconds
    @State private var isTimerActive = true
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Handle back action
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .font(.title2)
                }
                Spacer()
            }
            .padding()
            
            Text("Phone Verification")
                .font(.custom("Avenir", size: 34))
                .foregroundStyle(.black)
                .padding(.top, 20)
            
            Text("Verification code has been sent for your mobile number")
                .font(.custom("Avenir", size: 17))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, 10)
            
            // OTP Fields
            HStack(spacing: 12) {
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: $otp[index])
                        .font(.custom("Avenir", size: 20))
                        .frame(width: 50, height: 50)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .focused($focusedIndex, equals: index)
                        .background(
                            Circle()
                                .fill(Color.gray.opacity(0.2))
                        )
                        .overlay(
                            Circle()
                                .stroke(focusedIndex == index ? Color.orange : Color.gray.opacity(0.5), lineWidth: 0)
                        )
                        .onChange(of: otp[index]) {newValue in
                            if newValue.count > 1 {
                                otp[index] = String(newValue.prefix(1))
                            }
                            if !newValue.isEmpty {
                                focusedIndex = (index < 5) ? index + 1 : nil
                            }
                        }
                }
            }.padding(.top, 30)
            
            Button(action: {}) {
                HStack {
                    Image("verify_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Text("| Verify")
                        .foregroundColor(.white)
                }
                .frame(width: 250, height: 50)
                .background(
                  Color.gradientBg
                )
                .cornerRadius(10)
            }
            .padding(.top, 60)
            
            Text("Verification Code Expires After \(formattedTime())")
                .font(.caption)
                .padding(.top, 20)
            
            Spacer()
            Button(action: {
                // Handle edit number action
            }) {
                Text("Edit Number")
                    .font(.custom("Avenir", size: 17))
                    .foregroundColor(.gray)
                    .frame(width: 250)
                    .cornerRadius(10)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    
            }
//            .padding(.horizontal, 40)
            //.padding(.top, 40)
            .disabled(true) // Initially disabled
            Spacer()
            Spacer()
        }.padding(.horizontal)
        .onAppear {
            startTimer()
        }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                isTimerActive = false
            }
        }
    }
    
    private func formattedTime() -> String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

struct PhoneVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerificationView()
    }
}

#Preview {
    PhoneVerificationView()
}
