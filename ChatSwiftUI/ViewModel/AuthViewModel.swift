//
//  AuthViewModel.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 02/03/2022.
//

import Firebase
import UIKit

import Foundation
class AuthViewModel: NSObject, ObservableObject {
    
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    private override init() {
        print("Log in user from view model...")
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if let error = error {
                print("ERROR: Failed sign in with error '\(error.localizedDescription)'")
                return
            }
            
            self?.userSession = result?.user
            print("DEBUG: Successfully logged in...")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully registered user with Firebase...")
            guard let user = result?.user else { return }
            self?.tempCurrentUser = user
            let data: [String: Any] = [
                Constant.Firestore.Data.EMAIL : email,
                Constant.Firestore.Data.USERNAME : username,
                Constant.Firestore.Data.FULLNAME : fullname,
            ]
            
            Firestore.firestore().collection(Constant.Firestore.USER_FOLDER).document(user.uid).setData(data) { [weak self] _ in
                print("DEBUG: Successfully updated 'User-Info' in Firestore")
                self?.didAuthenticateUser = true
            }
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else {
            print("Failed to set current user...")
            return
        }
        ImageUploader.uploadImage(image: image) { imageURL in
            Firestore.firestore().collection(Constant.Firestore.USER_FOLDER).document(uid).updateData([Constant.Firestore.PROFILE_IMAGE_URL : imageURL]) { _ in
                print("DEBUG: Successfully updated user data...")
            }
        }
    }
    
    func signout() {
        try? Auth.auth().signOut() // Server-side
        userSession = Auth.auth().currentUser // Client-side is sync by the server-side instance
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection(Constant.Firestore.USER_FOLDER).document(uid).getDocument { (snapshot, error) in
            if let error = error {
                print("ERROR: Failed fetching data from Firestore: \(error.localizedDescription)")
            }
        }
    }
}
