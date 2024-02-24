//
//  HomeTabView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

struct HomeTabView: View {
    var body: some View {
        NavigationStack {
            headerView
            VStack(spacing: 20) {
                
                BannerView()
                    .padding()
                
                Divider()
                    .overlay(
                    Rectangle()
                    .stroke(Color(red: 0.98, green: 0.82, blue: 0.82), lineWidth: 1))
                
                recentSearches
                
                map
                
                Text("")
                    .frame(height: 30)
            }
            .scrollable()
        }
    }
    private var headerView: some View {
        HStack {
           Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 29, height: 37)
            
            Image("logoTitle")
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image("ticket")
            })
        }
        .padding(.horizontal, 30)
        .frame(height: 96)
        .background(.white)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
    }
    
    private var recentSearches: some View {
        VStack {
            HStack {
                Text("Similar to your recent searches")
                    .font(
                        Font.custom("Poppins-Medium", size: 12))
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    HStack {
                        Text("More")
                        
                        Image(systemName: "chevron.right")
                    }
                    .font(
                        Font.custom("Poppins-Medium", size: 12))
                    .foregroundStyle(Color.red)
                })
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<4) { index in
                        ItemCard()
                    }
                }
                .padding()
            }
        }
    }
    
    private var map: some View {
        VStack(alignment: .leading) {
            Text("Nearby Theaters")
                .font(Font.custom("Poppins-Medium", size: 12))
            
            Image("map")
                .resizable()
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(12)
                .overlay(
                RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Color(red: 0.96, green: 0.44, blue: 0.47), lineWidth: 1))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        HomeTabView()
    }
}
