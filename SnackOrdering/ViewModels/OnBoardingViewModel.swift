//
//  OnBoardingViewModel.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

class OnBoardingViewModel: ObservableObject {
    @Published var slides = [OnBoardingModel(image: "theatre", text: "Skip those lengthy lines and order your favorite movie                             snacks."),
                             OnBoardingModel(image: "theatre", text: "Skip those lengthy lines and order your favorite movie snacks."),
                             OnBoardingModel(image: "theatre", text: "Skip those lengthy lines and order your favorite movie snacks.")]
}
