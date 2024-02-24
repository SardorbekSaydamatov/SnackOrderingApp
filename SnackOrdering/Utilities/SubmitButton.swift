//
//  SubmitButton.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

struct SubmitButton: View {
    @State var title: String = "Submit"
    var onClick: () -> Void
    var body: some View {
        Button(action: {
            onClick()
        }, label: {
            Text(title)
        })
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .foregroundStyle(Color.white)
        .background(Color.red)
        .cornerRadius(10)
    }
}
