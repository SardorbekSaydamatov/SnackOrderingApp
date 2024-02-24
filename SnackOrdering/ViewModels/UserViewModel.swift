//
//  UserViewModel.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI
import FirebaseAuth

class UserViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var errorMessage: String?

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }

            if let error = error {

                self.errorMessage = "Sign-up error: \(error.localizedDescription)"
                print("Sign-up error: \(error.localizedDescription)")
            } else if let authResult = authResult {

                self.currentUser = authResult.user
                print("Sign-up successful: \(authResult.user.uid)")
            }
        }
    }
}
