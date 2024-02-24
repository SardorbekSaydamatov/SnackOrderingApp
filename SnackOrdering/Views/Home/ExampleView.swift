//
//  ExampleView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//

import SwiftUI

struct ExampleView: View {
    var body: some View {
        VStack {
            Image("CrispBucket")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding(.bottom, 30)
            Text("Sign in")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            VStack(spacing: 20) {
                TextField("Email", text: .constant(""))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .shadow(radius: 2.0)
                SecureField("Password", text: .constant(""))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .shadow(radius: 2.0)
                Button(action: {}) {
                    Text("Sign in")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(5.0)
                        .shadow(radius: 2.0)
                }
                HStack {
                    Button(action: {}) {
                        Text("Forgot password?")
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    Button(action: {}) {
                        Text("Create an account")
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    ExampleView()
}

