//
//  HomeView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        TabView {
            HomeTabView()
                .tag(0)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Categories Tab")
                .tag(1)
                .tabItem {
                    Label("Category", systemImage: "square.grid.2x2")
                }
            Text("Search Tab")
                .tag(2)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            Text("Cart Tab")
                .tag(3)
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
            Text("Account Tab")
                .tag(4)
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
        .accentColor(.red)
    }
}

#Preview {
    HomeView()
}
