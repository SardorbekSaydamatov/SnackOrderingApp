//
//  SnackOrderingApp.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//

import SwiftUI
import Firebase

@main
struct SnackOrderingApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
    }
}
