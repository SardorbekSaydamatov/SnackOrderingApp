//
//  ContentView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

struct ContentView: View {
    @State private var showSplash: Bool = true
    var body: some View {
        ZStack {
            if showSplash {
                LaunchScreenView()
                    .transition(.opacity)
            } else {
                OnBoardingView()
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
    ContentView()
}
