//
//  CustomBackButton.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

struct CustomBackButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(Color.red)
                .frame(width: 45, height: 45)
                .font(.title)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.red.opacity(0.3))
                )
        })
    }
}
