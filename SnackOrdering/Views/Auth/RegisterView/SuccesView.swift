//
//  SuccesView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

struct SuccesView: View {
    var body: some View {
        ZStack {
            Color(red: 1, green: 0.98, blue: 0.9)
                .ignoresSafeArea()
            VStack(spacing: 24) {
                Image("largeLogo")
                
                HStack {
                    Text("Congratulations")
                        .font(Font.custom("Poppins-Regular", size: 20).weight(.bold))
                        .foregroundStyle(Color(red: 0.77, green: 0.65, blue: 0.03))
                    Image("celebration")
                }
                
                Text("Your account has been successfully created. \nYou can now start exploring your snacks")
                    .multilineTextAlignment(.center)
            }
            .font(Font.custom("Poppins-Regular", size: 12))
        }
    }
}

#Preview {
    SuccesView()
}
