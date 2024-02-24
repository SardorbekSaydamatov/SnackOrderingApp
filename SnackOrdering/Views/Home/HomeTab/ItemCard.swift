//
//  ItemCard.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

struct ItemCard: View {
    var body: some View {
        VStack {
           Image("caramel")
                
            Divider()
                .overlay(
                Rectangle()
                .stroke(Color(red: 0.96, green: 0.44, blue: 0.47), lineWidth: 1))
            
            Text("Caramel \nKrisp Popcorn")
                .font(Font.custom("Poppins-Regular", size: 10))
                .multilineTextAlignment(.center)
        }
        .frame(width: 120, height: 168, alignment: .topLeading)
        .background(.white)
        .cornerRadius(12)
        .overlay(
        RoundedRectangle(cornerRadius: 12)
        .inset(by: 0.5)
        .stroke(Color(red: 0.96, green: 0.44, blue: 0.47), lineWidth: 1)
        )
        
    }
}

#Preview {
    ItemCard()
}
