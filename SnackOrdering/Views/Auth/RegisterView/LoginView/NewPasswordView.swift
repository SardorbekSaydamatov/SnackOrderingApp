//
//  NewPasswordView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//

import SwiftUI
import SwiftUI

struct NewPasswordView: View {
    @Environment (\.dismiss) var dismiss
    @State var password: String = ""
    @State var rePassword: String = ""
    @State var showSplashScreen: Bool = false
    var body: some View {
        VStack {
            header
            bottomView
            
            Text("")
                .frame(height: 100)
        }
        .scrollDismissesKeyboard(.interactively)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton{
            dismiss()
        })
        .fullScreenCover(isPresented: $showSplashScreen, content: {
            SplashScreen()
        })
    }
    private var header: some View {
        VStack(spacing: 15) {
            Text("Create new password")
                .font(Font.custom("Poppins-Regular", size: 24))
            Text("Your new password must be different \nfrom your old password")
                .multilineTextAlignment(.center)
                .font(Font.custom("Poppins-Regular", size: 12))
        }
    }
    private var bottomView: some View {
        VStack(alignment: .leading) {
            Text("New Password")
            YSecureField(text: $password, placeholder: "Enter new password")
                .padding(.bottom, 40)
            
            Text("COnfirm New Password")
            YSecureField(text: $rePassword, placeholder: "Confirm new password")
                .padding(.bottom, 50)
            
            SubmitButton(title: "Reset Password") {showSplashScreen.toggle()}
        }
        .font(Font.custom("Poppins-Regular", size: 12))
        .padding()
    }
}

#Preview {
    NavigationStack {
        NewPasswordView()
    }
}
