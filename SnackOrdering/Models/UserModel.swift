//
//  UserModel.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

struct UserModel: Identifiable {
    var id: String
    var fullName: String
    var email: String
    
    init(id: String, fullName: String, email: String) {
        self.id = id
        self.fullName = fullName
        self.email = email
    }
}
