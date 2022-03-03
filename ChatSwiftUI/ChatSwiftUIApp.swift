//
//  ChatSwiftUIApp.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 28/02/2022.
//

/*
 
 Description: Third party Firebase dependencies includes in the project.
 Repository: https://github.com/firebase/firebase-ios-sdk.git
 Swift Packages:
 - FirestoreAuth
 - Firestore
 - FirestoreSwift
 - FirestoreFunctions
 - Storage
 
 */

import SwiftUI
import Firebase

@main
struct ChatSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
