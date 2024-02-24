//
//  YTextField.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

struct YTextField: View {
    
    @Binding var text: String
    @State var placeholder: String = ""
    var body: some View {
        
        TextField(placeholder, text: $text)
            .textInputAutocapitalization(.never)
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .padding(.leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(Color.red))
        
    }
}
