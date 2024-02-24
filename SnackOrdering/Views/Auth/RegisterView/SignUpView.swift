//
//  SignUpView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var userViewModel = UserViewModel()
    @State var showOTP: Bool = false
    @State var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State var repassword: String = ""
    var body: some View {
        VStack {
            profileImage
            bodyView
        }
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle("Sign up")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $showOTP) {
            OTPView(otpViewSource: .sourceX)
        }
    }
    
    private var profileImage: some View {
        ZStack {
            Image("person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            Button(action: {
                
            }, label: {
                Image(systemName: "pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.white)
                    .background(
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(Color.red)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    )
            })
            .padding(.leading, 55)
            .padding(.top, 40)
        }
    }
    
    private var bodyView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Full name")
            YTextField(text: $fullName, placeholder: "Enter your name")
                .textContentType(.name)
            
            Text("Email")
            YTextField(text: $email, placeholder: "Enter your email address")
                .textContentType(.emailAddress)
            
            Text("Password")
            YSecureField(text: $password, placeholder: "Enter your password")
                .textContentType(.password)
            
            Text("Re-enter Password")
            YSecureField(text: $repassword, placeholder: "Confirm your password")
                .textContentType(.password)
            
            SubmitButton(title: "Sign up") {
                userViewModel.signUp(email: email, password: password)
            }
            .padding(.top, 40)
            
            HStack {
                Text("Already have an account?")
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Sign in")
                        .underline()
                })
            }
            .offset(x: 90)
        }
        .foregroundStyle(Color.init(uiColor: .label))
        .font(Font.custom("Poppins-Regular", size: 12))
        .padding()
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}

