//
//  ChatSwiftUIApp.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 28/02/2022.
//

import SwiftUI
import Firebase

@main
struct ChatSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(AuthViewModel())
        }
    }
}
