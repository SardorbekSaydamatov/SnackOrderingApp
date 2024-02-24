//
//  BannerView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI



struct BannerView: View {
    @State var currentIndex = 0
    @State var numberOfslides = 3
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<numberOfslides) { index in
                        ZStack {
                            SectionView(index: index)
                                .padding()
                                .id(index)
                            
                            HStack {
                                Button(action: {
                                    if currentIndex != 0 {
                                        withAnimation {
                                            currentIndex -= 1
                                            scrollView.scrollTo(currentIndex, anchor: .center)
                                        }
                                    }
                                }, label: {
                                    Image(systemName: "chevron.left")
                                        .foregroundStyle(Color.red)
                                })
                                .frame(width: 24, height: 24, alignment: .center)
                                .background(.white)
                                .cornerRadius(12)
                                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
                                .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                .inset(by: 0.5)
                                .stroke(.white, lineWidth: 1))
                                .opacity(currentIndex > 0 ? 1.0 : 0.0)
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation {
                                        if currentIndex < numberOfslides - 1 {
                                            currentIndex += 1
                                            scrollView.scrollTo(currentIndex, anchor: .center)
                                        } else {
                                            currentIndex = 0
                                            scrollView.scrollTo(currentIndex, anchor: .center)
                                        }
                                    }

                                }, label: {
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color.red)
                                })
                                .frame(width: 24, height: 24, alignment: .center)
                                .background(.white)
                                .cornerRadius(12)
                                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
                                .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                .inset(by: 0.5)
                                .stroke(.white, lineWidth: 1))
                            }
                            .padding(.horizontal, 25)
                        }
                    }
                }
            }
            .scrollDisabled(true)
            .coordinateSpace(name: "scroll")
            .onAppear {
                scrollView.scrollTo(currentIndex, anchor: .center)
            }
        }
    }
}

struct SectionView: View {
    let index: Int

    var body: some View {
        ZStack {
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 176)

            VStack(alignment: .leading) {
                Text("CS Coins Deal")
                    .font(Font.system(size: 14, weight: .bold))
                Text("Up to ") +
                Text("80% off")
                    .font(Font.system(size: 16, weight: .black))
                
                Button {
                    
                } label: {
                    Text("Check out")
                        .foregroundStyle(Color.white)
                }
                .frame(width: 112, height: 32)
                .background(Color(red: 0.93, green: 0.1, blue: 0.14))
                .cornerRadius(8)
            }
            .padding(.trailing, 100)
        }
        .frame(width: 320, height: 176)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(
                cornerRadius: 10
            )
            .stroke(lineWidth: 1).foregroundStyle(Color.red)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4))
    }
}
