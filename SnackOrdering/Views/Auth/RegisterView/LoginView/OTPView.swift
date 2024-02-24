//
//  OTPView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI
import Combine

enum OTPViewSource {
    case sourceX
    case sourceY
}

struct OTPView: View {
    @Environment (\.dismiss) var dismiss
    @State var showPasswordView: Bool = false
    @State var otpViewSource: OTPViewSource?
    @State var showHomeView: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            VStack(spacing: 20) {
                Text("Enter the Code")
                    .font(Font.custom("Poppins-Regular", size: 24).weight(.bold))
                Text("Check your email or SMS for the code,\nand enter it below to continue")
                    .multilineTextAlignment(.center)
                
                Text("Verification Code")
                    .offset(x: -125)
                    .padding(.top, 40)
                    .padding(.leading)
            }
            
            OTPTextFieldView(numberFields: 6)
                .padding(.bottom, 40)
                .padding(.horizontal)
            SubmitButton(title: "Verify") {
                if otpViewSource == .sourceX {
                    showHomeView = true
                    showPasswordView = false
                } else if otpViewSource == .sourceY {
                    showPasswordView = true
                    showHomeView = false
                }
            }
            
            HStack(spacing: 0) {
                Text("Didn't receive the code?")
                Button(action: {
                    
                }, label: {
                    Text("Resend")
                        .underline()
                })
            }
            Text("")
                .frame(height: 100)
        }
        .foregroundStyle(Color.init(uiColor: .label))
        .font(Font.custom("Poppins-Regular", size: 12))
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton{
            dismiss()
        })
        .navigationDestination(isPresented: $showPasswordView) {
            NewPasswordView()
        }
        .navigationDestination(isPresented: $showHomeView) {
            HomeView()
        }
    }
}


#Preview {
    NavigationStack {
        OTPView()
    }
}
