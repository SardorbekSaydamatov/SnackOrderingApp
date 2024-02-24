//
//  SplashScreen.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var showSplash: Bool = true
    var body: some View {
        ZStack {
            if showSplash {
                SuccesView()
                    .transition(.opacity)
            } else {
                HomeView()
            }
        }
        .onAppear(perform: {
            DispatchQueue.main
                .asyncAfter(deadline: .now() + 2)
                {
                    withAnimation {
                        showSplash = false
                    }
                }
        })
    }
}

#Preview {
    SplashScreen()
}
