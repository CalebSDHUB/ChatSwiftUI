//
//  Constant.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 03/03/2022.
//

struct Constant {
    struct Firestore {
        static let USER_FOLDER = "users"
        static let PROFILE_IMAGE_URL = "profileImageUrl"
        static let IMAGE_FOLDER = "/profile_images/"
        
        struct Data {
            static let EMAIL = "email"
            static let FULLNAME = "fullname"
            static let USERNAME = "username"
        }
    }
    
    struct Storage {
        static let IMAGE_FOLDER = "/profile_images/"
    }
    
    private init() {}
}
