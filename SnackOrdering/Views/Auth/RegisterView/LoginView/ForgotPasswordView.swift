//
//  ForgotPasswordView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

struct ForgotPasswordView: View {
    @Environment (\.dismiss) var dismiss
    @State var showOTP: Bool = false
    @State var email: String = ""
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 20) {
                Text("Forgot Password")
                    .font(
                        Font.custom("Poppins-Regular", size: 24)
                            .weight(.bold)
                    )
                
                Text("Oops, it happens to the best Of us.\nJust enter the email linked to your account.")
                    .font(Font.custom("Poppins-Regular", size: 12))
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom,40)
            
            bodyView
        }
        .scrollDismissesKeyboard(.interactively)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton(action: {
            dismiss()
        }))
        .navigationDestination(isPresented: $showOTP) {
            OTPView(otpViewSource: .sourceY)
        }
    }
    private var bodyView: some View{
        VStack(alignment: .leading) {
            Text("Email")
            YTextField(text: $email, placeholder: "Enter your email address")
            
            SubmitButton(title: "Send code") {showOTP.toggle()}
                .padding(.top, 50)
        }
        .font(Font.custom("Poppins-Regular", size: 12))
        .padding()
    }
}

#Preview {
    ForgotPasswordView()
}
