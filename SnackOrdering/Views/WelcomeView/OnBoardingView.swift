//
//  OnBoardingView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//

import SwiftUI

struct OnBoardingView: View {
    @ObservedObject var onboardingViewModel = OnBoardingViewModel()
    @State var numberOfSlides = 3
    @State var currentPage = 0
    @State var showLogIn: Bool = false
    
    var body: some View {
        VStack {
            imageView
            Spacer()
            pageControl
                
            Spacer(minLength: 60)
            
            Button(action: {
                withAnimation {
                        if currentPage == numberOfSlides - 1 {
                            showLogIn.toggle()
                        } else {
                            currentPage = (currentPage + 1) % numberOfSlides
                        }
                    }
            }, label: {
               
                    if currentPage == numberOfSlides - 1 {
                        Text("Get started")
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color.red)
                            .foregroundStyle(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    } else {
                        ZStack {
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: 60, height: 60)
                            
                            Image(systemName: "arrow.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                        }
                    }
                
            })
            Spacer(minLength: 40)
        }
        .navigationDestination(isPresented: $showLogIn) {
            LogInView()
        }
    }

    private var imageView: some View {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(onboardingViewModel.slides.indices, id: \.self) { index in
                            VStack(spacing: 130) {
                                Image(onboardingViewModel.slides[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 430, height: 400)
                                
                                Text(onboardingViewModel.slides[index].text)
                                    .frame(width: 250)
                                    .padding(.trailing)
                            }
                        }
                    }
                    .offset(x: CGFloat(currentPage) * -430)
                }
                .scrollDisabled(true)
                .font(Font.custom("Poppins-Regular", size: 16))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.init(uiColor: .label))
                .ignoresSafeArea(edges: .top)
            }
        }

    private var pageControl: some View {
        HStack(spacing: 8) {
            ForEach(0 ..< numberOfSlides) { page in
                Rectangle()
                    .frame(width: page == currentPage ? 23 : 8, height: 8)
                    .foregroundColor(page == currentPage ? .red : .red.opacity(0.3))
                    .cornerRadius(12)
            }
        }
    }
}

#Preview {
    OnBoardingView()
}

