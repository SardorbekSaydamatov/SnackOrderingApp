//
//  LoginView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

struct LogInView: View {
    @State var showHome: Bool = false
    @State var showSignUp: Bool = false
    @State var showPasswordView: Bool = false
    @State var shouldNavigate: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Text("Welcome to CineSnacks! Sign in to satisfy your snack cravings.")
                .multilineTextAlignment(.center)
                .font(Font.custom("Poppins-Regular", size: 12))
                .padding(.top)
            
            Spacer(minLength: 60)
            
            emailFields
            
            Spacer()
            
            otherAccounts
        }
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle("Sign in")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $showHome) {
            HomeView()
        }
        .navigationDestination(isPresented: $showSignUp) {
            SignUpView()
        }
        .navigationDestination(isPresented: $showPasswordView) {
            ForgotPasswordView()
        }
    }
    private var emailFields: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Email")
            YTextField(text: $email, placeholder: "Enter your email address")
                .textContentType(.emailAddress)
                .padding(.bottom)
            Text("Password")
            YSecureField(text: $password, placeholder: "Enter your password")
                .textContentType(.password)
            
            Button(action: {
                showPasswordView.toggle()
            }, label: {
                Text("Forgot password?")
                    .foregroundStyle(Color.init(uiColor: .label))
                    .underline()
            })
            .padding(.top)
            .offset(x: 250)
            
            SubmitButton(title: "Sign in") {
                showHome.toggle()
            }
        }
        .font(Font.custom("Poppins-Regular", size: 12))
        .padding(.horizontal)
    }
    
    private var otherAccounts: some View {
        VStack {
            HStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width / 3.3, height: 1)
                
                Text("Or continue with")
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width / 3.3, height: 1)
            }
            .font(Font.custom("Poppins-Regular", size: 12))
            .padding(20)
            
            HStack(spacing: 30) {
                Button(action: {
                    
                }, label: {
                    Image("google")
                        .padding(10)
                })
                .background(
                    RoundedRectangle(
                        cornerRadius: 12
                    )
                    .stroke(lineWidth: 1).foregroundStyle(Color.red))
                
                Button(action: {
                    
                }, label: {
                    Image("apple")
                        .padding(10)
                })
                .background(
                    RoundedRectangle(
                        cornerRadius: 12
                    )
                    .stroke(lineWidth: 1).foregroundStyle(Color.red))
                
                Button(action: {
                    
                }, label: {
                    Image("facebook")
                        .padding(10)
                })
                .background(
                    RoundedRectangle(
                        cornerRadius: 12
                    )
                    .stroke(lineWidth: 1).foregroundStyle(Color.red))
            }
            
            HStack(spacing: 5) {
                Text("Don't have an account?")
                Button(action: {
                    showSignUp.toggle()
                }, label: {
                    Text("Sign up")
                        .underline()
                })
            }
            .foregroundStyle(Color.init(uiColor: .label))
            .font(Font.custom("Poppins-Regular", size: 12))
            .padding(.top)
            
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        LogInView()
    }
}
