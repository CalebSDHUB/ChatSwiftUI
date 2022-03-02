//
//  AuthViewModel.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 02/03/2022.
//

import Firebase

import Foundation
class AuthViewModel: NSObject, ObservableObject {
    func login() {
        print("Log in user from view model...")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully registered user with Firebase!!!")
            guard let user = result?.user else { return }
            
            let data: [String: Any] = [
                "email" : email,
                "username" : username,
                "fullname" : fullname,
            ]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                print("DEBUG: Successfully updated 'User-Info' in Firestore")
            }
        }
    }
    
    func signout() {
        
    }
}
